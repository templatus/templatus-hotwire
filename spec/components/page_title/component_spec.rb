describe PageTitle::Component, type: :component do
  subject(:output) { render_inline(instance) }

  let(:instance) { described_class.new('Hello, world!') }

  it { is_expected.to have_css('h1', text: 'Hello, world!') }
end
