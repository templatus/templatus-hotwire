describe 'Theme' do
  it 'renders the theme from the cookie' do
    cookies[:theme] = 'dark'

    get root_path

    expect(response.body).to include('<html lang="en" data-theme="templatus-dark">')
  end

  it 'renders no theme without a cookie, so the OS preference wins' do
    get root_path

    expect(response.body).to include('<html lang="en">')
  end
end
