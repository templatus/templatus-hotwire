describe 'Basic tests' do
  it 'can navigate' do
    visit root_path

    click_on 'About'
    expect(page).to have_css('main h1', text: 'About')

    click_on 'Home'
    expect(page).to have_css('main h1', text: 'Hello')
  end

  it 'can click' do
    visit root_path

    expect(page).to have_css('main h1', text: 'Hello, Templatus!')
    expect(page).to have_css('#counter', text: '0')

    click_on 'Click me!'
    expect(page).to have_css('#counter', text: '1')
    expect(page).to have_css('ul', text: '127.0.0.0')
    expect(page).to have_css('li', count: 1)
    expect(page).to have_css('#flash', text: 'successfully')
  end
end
