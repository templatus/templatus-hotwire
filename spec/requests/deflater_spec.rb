describe 'Rack::Deflater', type: :request do
  it 'compresses with gzip if requested' do
    ['gzip', 'deflate, gzip', 'gzip, deflate'].each do |compression_method|
      get root_path, headers: { HTTP_ACCEPT_ENCODING: compression_method }

      expect(response.headers['Content-Encoding']).to eq('gzip')
    end
  end

  it 'does not compress if not requested' do
    get root_path

    expect(response.headers).not_to have_key('Content-Encoding')
  end
end
