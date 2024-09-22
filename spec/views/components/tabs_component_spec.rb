describe TabsComponent, type: :component do
  subject(:component) { described_class.new }

  it 'renders links' do
    result =
      render(component) do |c|
        c.tab text: 'One', href: '/1'
        c.tab text: 'Two', href: '/2'
        c.tab text: 'Three', href: '/3'
      end

    expect(result).to have_css('nav > a', count: 3)
  end
end
