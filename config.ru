# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

if Rails.env.production? && Rails.configuration.x.app_host
  # Redirect to a canonical host
  use Rack::CanonicalHost,
      Rails.configuration.x.app_host,
      cache_control: 'no-cache'
end

run Rails.application
Rails.application.load_server
