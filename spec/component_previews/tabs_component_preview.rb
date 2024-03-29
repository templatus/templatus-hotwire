class TabsComponentPreview < ViewComponent::Preview
  def with_default
    render Tabs::Component.new do |c|
      c.with_tabs [
                    { text: 'Foo', href: '/foo' },
                    { text: 'Bar', href: '/bar' },
                    { text: 'Baz', href: '/baz' },
                  ]
    end
  end
end
