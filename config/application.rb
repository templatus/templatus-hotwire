require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'action_mailer/railtie'
require 'active_job/railtie'
require 'action_cable/engine'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TemplatusHotwire
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.time_zone = ENV.fetch('TIME_ZONE', 'Berlin')

    config.x.app_host = ENV.fetch('APP_HOST', 'templatus-hotwire.test')

    config.x.git.commit_version =
      ENV.fetch('COMMIT_VERSION') { `git describe --always`.chomp }

    config.x.git.commit_time =
      ENV.fetch('COMMIT_TIME') { `git show -s --format=%cI`.chomp }

    config.x.honeybadger.api_key = ENV['HONEYBADGER_API_KEY'].presence

    config.x.cypress =
      (Rails.env.development? || Rails.env.test?) &&
        ActiveModel::Type::Boolean.new.cast(ENV.fetch('CYPRESS', false))
  end
end
