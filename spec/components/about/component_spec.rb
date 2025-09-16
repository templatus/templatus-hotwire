describe About::Component, type: :component do
  subject { render_inline(described_class.new) }

  it { is_expected.to have_content('Ruby on Rails') }
  it { is_expected.to have_content(Rails::VERSION::STRING) }
  it { is_expected.to have_link(href: '/sidekiq') }
end
