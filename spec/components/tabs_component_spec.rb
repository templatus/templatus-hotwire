describe TabsComponent, type: :component do
  it 'renders links' do
    result =
      render_inline(described_class.new) do |c|
        c.tabs [
                 { text: 'One', href: '/1' },
                 { text: 'Two', href: '/2' },
                 { text: 'Three', href: '/3' },
               ]
      end

    expect(result.css('nav').to_html).to include('href="/1"')
  end
end
