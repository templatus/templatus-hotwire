describe 'Statics' do
  it 'serves a webmanifest file' do
    get webmanifest_path

    expect(response).to have_http_status(:success)
  end
end
