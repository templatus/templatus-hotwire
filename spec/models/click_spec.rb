describe Click do
  let(:click) { create(:click, ip: '1.2.3.4', user_agent: 'IRB') }

  it 'saves payload' do
    click.reload
    expect(click.ip).to eq('1.2.3.4')
    expect(click.user_agent).to eq('IRB')
  end
end
