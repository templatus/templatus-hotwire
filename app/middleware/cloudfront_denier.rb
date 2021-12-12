# Middleware to deny CloudFront requests to non-assets
# http://ricostacruz.com/til/rails-and-cloudfront

class CloudfrontDenier
  def initialize(app, target:)
    @app = app
    @target = target
  end

  def call(env)
    if cloudfront?(env) && !asset?(env)
      [302, { 'Location' => @target }, []]
    else
      @app.call(env)
    end
  end

  def asset?(env)
    env['PATH_INFO'] =~ %r{^/assets/}
  end

  def cloudfront?(env)
    env['HTTP_USER_AGENT'] == 'Amazon CloudFront'
  end
end
