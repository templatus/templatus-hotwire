describe 'Clicks' do
  describe 'GET /' do
    before { create_list(:click, 10) }

    it 'lists existing clicks' do
      get root_path

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET / with keyset pagination' do
    let(:per_page) { ClicksController::PER_PAGE }

    def cursor_from(response_body)
      response_body[/page=([^"&]+)/, 1]
    end

    context 'when there are more clicks than fit on one page' do
      before { create_list(:click, per_page + 3) }

      it 'renders a load-more sentinel with a cursor' do
        get root_path

        expect(response.body).to include(Clicks::Component::LOAD_MORE_ID)
        expect(cursor_from(response.body)).to be_present
      end

      it 'returns the remaining clicks as a turbo stream' do
        get root_path
        cursor = cursor_from(response.body)

        get root_path(page: cursor), as: :turbo_stream

        expect(response).to have_http_status(:success)
        expect(response.media_type).to eq(Mime[:turbo_stream].to_s)
        expect(response.body).to include('action="append" target="list"')
      end

      it 'walks through all clicks without gaps or duplicates' do
        seen = []
        url = root_path

        loop do
          get url, as: :turbo_stream
          seen.concat(response.body.scan(/data-click-id="(\d+)"/).flatten)

          cursor = cursor_from(response.body)
          break unless cursor

          url = root_path(page: cursor)
        end

        expect(seen).to eq(Click.order(created_at: :desc, id: :desc).ids.map(&:to_s))
      end
    end

    # The cursor is JSON-encoded, and Time#as_json truncates to milliseconds
    # while Postgres stores microseconds. Without the controller's
    # :pre_serialize the clicks sharing a millisecond would be skipped.
    context 'when clicks share the same millisecond' do
      let(:timestamp) { Time.zone.parse('2026-07-19 12:00:00.123456') }

      before do
        # 10 microseconds apart, so all of them share the millisecond .123
        (per_page + 2).times do |i|
          create(:click, created_at: timestamp + Rational(i, 100_000))
        end
      end

      it 'does not skip any click across the page boundary' do
        seen = []
        url = root_path

        loop do
          get url, as: :turbo_stream
          seen.concat(response.body.scan(/data-click-id="(\d+)"/).flatten)

          cursor = cursor_from(response.body)
          break unless cursor

          url = root_path(page: cursor)
        end

        expect(seen.uniq.size).to eq(Click.count)
      end
    end

    context 'when all clicks fit on one page' do
      before { create_list(:click, 3) }

      it 'renders an inert sentinel without a cursor' do
        get root_path

        expect(response.body).to include(Clicks::Component::LOAD_MORE_ID)
        expect(response.body).not_to include('data-load-more-url-value="/?page=')
      end
    end
  end

  describe 'POST /clicks' do
    let(:user_agent) { 'Netscape Navigator' }

    def call(ip)
      post clicks_path(format: :turbo_stream),
           headers: {
             HTTP_USER_AGENT: user_agent,
             REMOTE_ADDR: ip,
           }
    end

    context 'when IPv4' do
      let(:ipv4) { '1.2.3.4' }

      it 'save click and returns http success' do
        call(ipv4)

        expect(Click.last.ip).to eq('1.2.3.0')
        expect(response).to have_http_status(:success)
        expect(Click.last.user_agent).to eq(user_agent)
      end
    end

    context 'when IPv6' do
      let(:ipv6) { '2001:db8::1' }

      it 'save click and returns http success' do
        call(ipv6)

        expect(Click.last.ip).to eq('2001:0db8:0:0:0:0:0:0')
        expect(response).to have_http_status(:success)
        expect(Click.last.user_agent).to eq(user_agent)
      end
    end

    context 'when saving fails' do
      let(:ipv6) { 'invalid' }

      it 'fails and returns http failure' do
        call(ipv6)

        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end
end
