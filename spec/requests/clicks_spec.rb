describe 'Clicks' do
  include ActiveSupport::Testing::TimeHelpers

  let(:user_agent) { 'Netscape Navigator' }
  let(:ip) { '1.2.3.4' }

  describe 'POST /create' do
    it 'save click and returns http success' do
      post '/clicks',
           headers: {
             HTTP_USER_AGENT: user_agent,
             REMOTE_ADDR: ip,
             ACCEPT: 'application/json',
           }

      expect(response).to have_http_status(:success)

      expect(Click.last.user_agent).to eq(user_agent)
      expect(Click.last.ip).to eq('1.2.3.0')
    end
  end
end
