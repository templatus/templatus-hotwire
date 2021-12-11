describe 'Clicks' do
  include ActiveSupport::Testing::TimeHelpers

  let(:user_agent) { 'Netscape Navigator' }
  let(:ip) { '1.2.3.4' }

  describe 'POST /clicks' do
    let(:user_agent) { 'Netscape Navigator' }

    def call(ip)
      post clicks_path,
           headers: {
             HTTP_USER_AGENT: user_agent,
             REMOTE_ADDR: ip,
             ACCEPT: 'application/json',
           }

      expect(response).to have_http_status(:success)
      expect(Click.last.user_agent).to eq(user_agent)
    end

    context 'when IPv4' do
      let(:ipv4) { '1.2.3.4' }

      it 'saves click' do
        call(ipv4)

        expect(Click.last.ip).to eq('1.2.3.0')
      end
    end

    context 'when IPv6' do
      let(:ipv6) { '2001:db8::1' }

      it 'saves click' do
        call(ipv6)

        expect(Click.last.ip).to eq('2001:0db8:0:0:0:0:0:0')
      end
    end
  end

  describe 'GET /index' do
    around { |example| freeze_time(&example) }

    before { Click.create! ip: ip, user_agent: user_agent }

    it 'save click and returns http success' do
      get '/clicks', headers: { ACCEPT: 'application/json' }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to match(
        'total' => 1,
        'items' => [
          hash_including(
            {
              'created_at' => Time.current.as_json,
              'ip' => ip,
              'user_agent' => user_agent,
            },
          ),
        ],
      )
    end
  end
end
