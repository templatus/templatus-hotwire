describe 'Unsupported browsers' do
  # Rails serves public/406-unsupported-browser.html for these. That file was
  # already in the repo but nothing referenced it before allow_browser.
  let(:internet_explorer) do
    'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko'
  end

  let(:recent_chrome) do
    'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 ' \
      '(KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36'
  end

  it 'turns away a browser that predates the features this app relies on' do
    get root_path, headers: { 'HTTP_USER_AGENT' => internet_explorer }

    expect(response).to have_http_status(:not_acceptable)
    expect(response.body).to include('Your browser is not supported')
  end

  it 'lets a current browser through' do
    get root_path, headers: { 'HTTP_USER_AGENT' => recent_chrome }

    expect(response).to have_http_status(:ok)
  end
end
