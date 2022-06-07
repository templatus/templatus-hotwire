# Remove 'x-runtime' header
Rails.application.config.middleware.delete(Rack::Runtime)

# Add content_type for some file extension not included in the
# list of defaults: https://github.com/rack/rack/blob/master/lib/rack/mime.rb
Rack::Mime::MIME_TYPES['.webmanifest'] = 'application/manifest+json'

# Enable gzip and brotli compression
Rails.application.config.middleware.use Rack::Deflater
Rails.application.config.middleware.use Rack::Brotli

if Rails.application.config.x.app_host
  # Allow serving of images, stylesheets, and JavaScripts from the app_host only
  Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins Rails.application.config.x.app_host
      resource '*', headers: :any, methods: %i[get post options]
    end
  end

  # CDN: Allow Cloudfront for assets only
  if Rails.application.config.asset_host
    require 'cloudfront_denier'

    Rails.application.config.middleware.use CloudfrontDenier,
                    target: "https://#{Rails.application.config.x.app_host}"
  end
end
