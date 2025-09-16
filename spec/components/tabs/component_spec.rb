describe Tabs::Component, type: :component do
  subject(:component) { described_class.new }

  it 'renders links' do
    result =
      render_inline(component) do |c|
        c.with_tab text: 'One', href: '/1'
        c.with_tab text: 'Two', href: '/2'
        c.with_tab text: 'Three', href: '/3'
      end

    expect(result).to have_css('nav > a', count: 3)
  end
end
