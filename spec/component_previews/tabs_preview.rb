class TabsPreview < ViewComponent::Preview
  def with_default
    render Tabs::Component.new do |c|
      c.with_tab text: 'Foo', href: '/foo'
      c.with_tab text: 'Bar', href: '/bar'
      c.with_tab text: 'Baz', href: '/baz'
    end
  end
end
