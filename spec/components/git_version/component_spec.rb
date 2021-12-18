describe GitVersion::Component, type: :component do
  subject(:output) { render_inline(instance) }

  let(:instance) do
    described_class.new commit_version: '1234567',
                        commit_time: '2021-12-24T18:00:00+01:00'
  end

  it { is_expected.to have_css('code', text: '1234567') }
  it { is_expected.to have_css('time[datetime="2021-12-24T18:00:00+01:00"]') }
  it { is_expected.to have_css('time[data-controller="timeago"]') }
end
