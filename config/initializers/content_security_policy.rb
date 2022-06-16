# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

Rails.application.configure do
  config.content_security_policy do |policy|
    if Rails.env.development?
      policy.style_src :self,
                       # Allow @vite/client to hot reload style changes
                       :unsafe_inline

      policy.script_src :self,
                        :unsafe_inline,
                        # Allow Lookbook to build component previews
                        :unsafe_eval,
                        # Allow @vite/client to hot reload JavaScript changes
                        "https://#{ViteRuby.config.host}"

      policy.connect_src :self,
                         # Allow ActionCable connection
                         "wss://#{ENV.fetch('APP_HOST', nil)}",
                         # Allow @vite/client to hot reload CSS changes
                         "wss://#{ViteRuby.config.host}"
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
        *[
          :self,
          Rails.configuration.asset_host.presence,
          '\'sha256-W49+qLXTvblxo3uhW+zCJ7W79iSK1/XLC2fBoPuDgHM=\'', # Lockup
        ].compact,
      )
      policy.style_src(
        *[
          :self,
          Rails.configuration.asset_host.presence,
          '\'sha256-rql2tlBWA4Hb3HHbUfw797urk+ifBd6EAovoOUGt0oI=\'', # Turbo progress bar
          '\'sha256-MU5QaehzQCq1x6U38PLxcooVZTB7oVn8ZtoAKdaog8Q=\'', # Lockup
        ].compact,
      )
      policy.frame_src(
        *[:self, Rails.configuration.asset_host.presence].compact,
      )
      policy.connect_src(
        *[
          :self,
          "wss://#{ENV.fetch('APP_HOST', nil)}",
          (
            if Rails.configuration.x.honeybadger.api_key
              'https://api.honeybadger.io'
            end
          ),
          Rails.configuration.x.plausible_url.presence,
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

    # Generate session nonces for permitted importmap and inline scripts
    #   config.content_security_policy_nonce_generator = ->(request) { request.session.id.to_s }
    #   config.content_security_policy_nonce_directives = %w(script-src)
    #
    #   # Report violations without enforcing the policy.
    #   # config.content_security_policy_report_only = true
  end
end
