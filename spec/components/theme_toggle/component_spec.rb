describe ThemeToggle::Component, type: :component do
  subject(:component) { described_class.new }

  it 'renders an option per mode' do
    result = render_inline(component)

    expect(result).to have_css('[data-theme-target="option"]', count: 3)
  end

  it 'renders only the light and dark icons in the button' do
    result = render_inline(component)

    expect(result).to have_css('[data-theme-target="icon"]', count: 2)
    expect(result).to have_no_css('[data-theme-target="icon"][data-mode="auto"]')
  end

  it 'defaults to the system mode' do
    result = render_inline(component)

    expect(result).to have_css(
      '[data-theme-target="option"][data-mode="auto"][aria-checked="true"]',
    )
  end
end
