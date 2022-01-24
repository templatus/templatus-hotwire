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
      post clicks_path,
           headers: {
             HTTP_USER_AGENT: user_agent,
             REMOTE_ADDR: ip,
           }

      expect(response).to have_http_status(:success)
      expect(Click.last.user_agent).to eq(user_agent)
    end

    context 'when IPv4' do
      let(:ipv4) { '1.2.3.4' }

      it 'save click and returns http success' do
        call(ipv4)

        expect(Click.last.ip).to eq('1.2.3.0')
      end
    end

    context 'when IPv6' do
      let(:ipv6) { '2001:db8::1' }

      it 'save click and returns http success' do
        call(ipv6)

        expect(Click.last.ip).to eq('2001:0db8:0:0:0:0:0:0')
      end
    end
  end
end
