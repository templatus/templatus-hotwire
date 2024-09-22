class ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout
  include Phlex::Rails::Helpers::AssetPath
  include Phlex::Rails::Helpers::TurboFrameTag
  include Phlex::Rails::Helpers::Flash

  def view_template(&)
    doctype

    html lang: 'en' do
      head do
        meta_tags
        csrf_meta_tags
        action_cable_meta_tag

        title { 'Templatus-Hotwire' }
        links
        vite_tags
      end

      html_body(&)
    end
  end

  private

  def meta_tags # rubocop:disable Metrics/AbcSize
    meta charset: 'utf-8'

    meta name: 'description',
         content: 'Ruby on Rails template for using Hotwire'

    meta name: 'viewport', content: 'width=device-width,initial-scale=1'
    meta name: 'mobile-web-app-capable', content: 'yes'
    meta name: 'application-name', content: 'Templatus (Hotwire edition)'
    meta name: 'theme-color', content: '#991c1c'
    meta name: 'msapplication-TileColor', content: '#ffc40d'
    meta name: 'apple-mobile-web-app-capable', content: 'yes'
    meta name: 'apple-mobile-web-app-title',
         content: 'Templatus (Hotwire edition)'
    meta name: 'apple-mobile-web-app-status-bar-style', content: 'black'

    if Rails.configuration.x.honeybadger.api_key
      meta name: 'honeybadger-api-key',
           content: Rails.configuration.x.honeybadger.api_key
    end

    if Rails.configuration.x.app_host
      meta name: 'app-host', content: Rails.configuration.x.app_host
    end

    if Rails.configuration.x.plausible_url
      meta name: 'plausible-url', content: Rails.configuration.x.plausible_url
    end

    meta name: 'git-commit-version',
         content: Rails.configuration.x.git.commit_version

    meta name: 'git-commit-time', content: Rails.configuration.x.git.commit_time
  end

  def links
    link(
      href: asset_path('/apple-touch-icon.png'),
      rel: 'apple-touch-icon',
      type: 'image/png',
      sizes: '180x180',
    )
    link(
      href: asset_path('/favicon-32x32.png'),
      rel: 'icon',
      type: 'image/png',
      sizes: '32x32',
    )
    link(
      href: asset_path('/favicon-16x16.png'),
      rel: 'icon',
      type: 'image/png',
      sizes: '16x16',
    )
    link(
      href: asset_path('/safari-pinned-tab.svg'),
      rel: 'mask-icon',
      color: '#d30001',
    )
    link(href: webmanifest_path, rel: 'manifest')
    link(
      href: helpers.vite_asset_path('images/logo.svg'),
      rel: 'preload',
      as: 'image',
    )
  end

  def vite_tags
    unsafe_raw helpers.vite_client_tag
    unsafe_raw helpers.vite_typescript_tag 'application',
                                           'data-turbo-track': 'reload'
    unsafe_raw helpers.vite_stylesheet_tag 'application',
                                           'data-turbo-track': 'reload'
  end

  def html_body(&) # rubocop:disable Metrics/AbcSize
    body(
      class:
        'min-h-screen flex flex-col bg-gradient-to-br from-primary to-secondary lg:bg-tertiary lg:from-inherit lg:to-inherit',
    ) do
      render AppBackgroundComponent.new

      render AppHeaderComponent.new class: 'lg:fixed lg:top-10 lg:left-10'

      turbo_frame_tag 'flash' do
        if flash.present?
          render AppFlashComponent.new notice: flash[:notice],
                                       alert: flash[:alert]
        end
      end

      main(
        class:
          'relative flex-1 px-4 py-5 bg-white shadow-md sm:px-6 lg:px-8 lg:mt-10 lg:mr-16 lg:ml-96 lg:max-w-5xl lg:rounded-xl',
        &
      )

      render AppFooterComponent.new class:
                                      'relative mt-2 mb-6 lg:px-0 lg:mr-16 lg:ml-96 lg:max-w-5xl'
    end
  end
end
