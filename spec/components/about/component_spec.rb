describe About::Component, type: :component do
  subject { render_inline(described_class.new) }

  it { is_expected.to have_text('Ruby on Rails') }
  it { is_expected.to have_text(Rails::VERSION::STRING) }
  it { is_expected.to have_link(href: '/sidekiq') }
end
