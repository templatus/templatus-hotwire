describe 'Clicks' do
  describe 'GET /' do
    before { create_list(:click, 10) }

    it 'lists existing clicks' do
      get root_path

      expect(response).to have_http_status(:success)
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

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
