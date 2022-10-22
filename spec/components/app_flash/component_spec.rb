describe AppFlash::Component, type: :component do
  it 'renders notice' do
    result = render_inline(described_class.new(notice: 'All good!'))

    expect(result.to_html).to include('All good!')
  end

  it 'renders alert' do
    result = render_inline(described_class.new(alert: 'Something went wrong!'))

    expect(result.to_html).to include('Something went wrong!')
  end
end
