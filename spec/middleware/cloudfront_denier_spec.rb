describe CloudfrontDenier do
  subject(:middleware) { described_class.new(app, target: host) }

  let(:host) { 'https://example.com' }
  let(:app) { ->(env) { [200, env, 'OK'] } }

  it 'accepts request for asset' do
    code, = middleware.call env_for('http://example.com/assets/example.js')

    expect(code).to eq(200)
  end

  it 'accepts request for asset from CloudFront' do
    code, =
      middleware.call env_for(
                        'http://example.com/assets/example.js',
                        'HTTP_USER_AGENT' => 'Amazon CloudFront',
                      )

    expect(code).to eq(200)
  end

  it 'accepts request for non-assets from browser' do
    code, =
      middleware.call env_for(
                        'http://example.com/index.html',
                        'HTTP_USER_AGENT' => 'Firefox',
                      )

    expect(code).to eq(200)
  end

  it 'rejects request for non-assets from CloudFront' do
    code, env =
      middleware.call env_for(
                        'http://example.com/index.html',
                        'HTTP_USER_AGENT' => 'Amazon CloudFront',
                      )

    expect(code).to eq(302)
    expect(env['Location']).to eq(host)
  end

  def env_for(url, **opts)
    Rack::MockRequest.env_for(url, opts)
  end
end
