# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy
# For further information see the following documentation
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy

Rails.application.configure do
  config.content_security_policy do |policy|
    if Rails.env.development?
      policy.script_src :self, :unsafe_eval, :unsafe_inline
      policy.connect_src :self,
                         "wss://#{ENV['APP_HOST']}",
                         'http://localhost:8082'
    else
      policy.default_src :none
      policy.font_src(
        *[:self, :data, Rails.configuration.asset_host.presence].compact,
      )
      policy.img_src(
        *[:self, :data, Rails.configuration.asset_host.presence].compact,
      )
      policy.object_src :none
      policy.script_src(
        *[:self, Rails.configuration.asset_host.presence].compact,
      )
      policy.style_src(
        *[
          :self,
          Rails.configuration.asset_host.presence,
          "'sha256-rql2tlBWA4Hb3HHbUfw797urk+ifBd6EAovoOUGt0oI='", # Turbo progress bar
        ].compact,
      )
      policy.frame_src(
        *[:self, Rails.configuration.asset_host.presence].compact,
      )
      policy.connect_src(
        *[
          :self,
          "wss://#{ENV['APP_HOST']}",
          (
            if Rails.configuration.x.honeybadger.api_key
              'https://api.honeybadger.io'
            end
          ),
        ].compact,
      )
      policy.manifest_src :self
      policy.frame_ancestors :none
    end
    policy.base_uri :self
    policy.form_action :self

    # Specify URI for violation reports
    # if Rails.configuration.x.honeybadger.api_key
    #   policy.report_uri(
    #     "https://api.honeybadger.io/v1/browser/csp?api_key=#{Rails.configuration.x.honeybadger.api_key}&report_only=true",
    #   )
    # end
  end
end

# If you are using UJS then enable automatic nonce generation
# Rails.application.config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }

# Set the nonce only to specific directives
# Rails.application.config.content_security_policy_nonce_directives = %w(script-src)

# Report CSP violations to a specified URI
# For further information see the following documentation:
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
# Rails.application.config.content_security_policy_report_only = true
