class TabsPreview < ViewComponent::Preview
  def with_default
    render Components::Tabs.new do |c|
      c.tab text: 'Foo', href: '/foo'
      c.tab text: 'Bar', href: '/bar'
      c.tab text: 'Baz', href: '/baz'
    end
  end
end
