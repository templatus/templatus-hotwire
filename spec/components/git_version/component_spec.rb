describe GitVersion::Component, type: :component do
  subject(:output) { render_inline(instance) }

  let(:instance) { described_class.new }

  before do
    allow(instance).to receive(:commit_version).and_return('1234567')

    allow(instance).to receive(:commit_time).and_return(
      '2021-12-24T18:00:00+01:00',
    )
  end

  it { is_expected.to have_css('code', text: '1234567') }
  it { is_expected.to have_css('time[datetime="2021-12-24T18:00:00+01:00"]') }
  it { is_expected.to have_css('time[data-controller="timeago"]') }
end
