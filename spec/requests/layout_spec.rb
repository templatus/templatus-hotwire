describe 'Layout' do
  describe 'document title' do
    it 'uses the page title from the home page' do
      get root_path

      expect(response.body).to include('<title>Hello, Templatus! · Templatus-Hotwire</title>')
    end

    it 'uses the page title from the about page' do
      get about_path

      expect(response.body).to include('<title>About · Templatus-Hotwire</title>')
    end
  end

  describe 'skip link' do
    it 'points at the main landmark' do
      get root_path

      expect(response.body).to include('href="#main"').and include('<main id="main"')
    end
  end
end
