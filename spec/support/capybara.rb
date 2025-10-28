require 'capybara/rspec'

Capybara.register_driver :my_playwright do |app|
  Capybara::Playwright::Driver.new(
    app,
    browser_type: ENV.fetch('PLAYWRIGHT_BROWSER', 'chromium').to_sym,
    headless: ENV['CI'].present? || ENV['PLAYWRIGHT_HEADLESS'].present?,
  )
end

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :my_playwright
  end
end
