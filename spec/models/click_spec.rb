# == Schema Information
#
# Table name: clicks
#
#  id         :bigint           not null, primary key
#  ip         :inet             not null
#  user_agent :string           not null
#  created_at :datetime         not null
#
describe Click do
  let(:click) { create(:click, ip: '1.2.3.4', user_agent: 'IRB') }

  it 'saves payload' do
    click.reload
    expect(click.ip).to eq('1.2.3.4')
    expect(click.user_agent).to eq('IRB')
  end
end
