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

  it 'loads older clicks while scrolling down' do
    per_page = ClicksController::PER_PAGE
    create_list(:click, (per_page * 2) + 5)

    visit root_path
    expect(page).to have_css('li[data-click-id]', count: per_page)

    scroll_to_bottom
    expect(page).to have_css('li[data-click-id]', count: per_page * 2)

    scroll_to_bottom
    expect(page).to have_css('li[data-click-id]', count: Click.count)

    # The sentinel is exhausted, so no further requests are triggered
    scroll_to_bottom
    expect(page).to have_no_css('[data-load-more-url-value]:not([data-load-more-url-value=""])')

    # Oldest click is the last one in the list
    oldest = Click.order(:created_at, :id).first
    expect(page).to have_css("li[data-click-id='#{oldest.id}']")
  end

  def scroll_to_bottom
    page.execute_script('window.scrollTo(0, document.body.scrollHeight)')
  end
end
