describe PageTitle::Component, type: :component do
  subject(:output) { render_inline(described_class.new('Hello, world!')) }

  let(:instance) { described_class.new }

  it { is_expected.to have_css('h1', text: 'Hello, world!') }
end
