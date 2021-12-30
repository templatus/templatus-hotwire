describe About::Component, type: :component do
  include Rails.application.routes.url_helpers

  subject { render_inline(described_class.new).css('p').to_html }

  it { is_expected.to include('Ruby on Rails') }
  it { is_expected.to include(Rails::VERSION::STRING) }
  it { is_expected.to include(sidekiq_web_path) }
end
