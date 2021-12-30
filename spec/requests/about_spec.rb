describe 'About' do
  describe 'GET /about' do
    it 'renders page' do
      get about_path

      expect(response).to have_http_status(:success)
    end
  end
end
