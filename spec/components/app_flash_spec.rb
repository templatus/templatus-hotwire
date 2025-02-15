describe Components::AppFlash, type: :component do
  it 'renders notice' do
    result = render(described_class.new(notice: 'All good!'))

    expect(result).to have_content('All good!')
  end

  it 'renders alert' do
    result = render(described_class.new(alert: 'Something went wrong!'))

    expect(result).to have_content('Something went wrong!')
  end
end
