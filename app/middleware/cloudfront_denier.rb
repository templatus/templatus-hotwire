# Middleware to deny CloudFront requests to non-assets
# http://ricostacruz.com/til/rails-and-cloudfront

class CloudfrontDenier
  def initialize(app, target:)
    @app = app
    @target = target
  end

  def call(env)
    if cloudfront?(env) && !asset?(env)
      # Rack 3 mandates lowercase header names.
      [302, { 'location' => @target, 'content-type' => 'text/plain' }, []]
    else
      @app.call(env)
    end
  end

  # Vite writes the bundles to public/vite; /assets is kept for anything
  # still served by Propshaft.
  def asset?(env)
    env['PATH_INFO'] =~ %r{^/(vite|assets)/}
  end

  def cloudfront?(env)
    env['HTTP_USER_AGENT'] == 'Amazon CloudFront'
  end
end
