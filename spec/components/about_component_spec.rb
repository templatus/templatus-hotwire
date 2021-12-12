describe AboutComponent, type: :component do
  it 'renders something useful' do
    expect(render_inline(described_class.new).css('p').to_html).to include(
      'Ruby on Rails',
    )
  end
end
