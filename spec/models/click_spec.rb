describe Click do
  it 'saves payload' do
    click = described_class.create! ip: '1.2.3.4', user_agent: 'IRB'

    click.reload
    expect(click.ip).to eq('1.2.3.4')
    expect(click.user_agent).to eq('IRB')
  end
end
