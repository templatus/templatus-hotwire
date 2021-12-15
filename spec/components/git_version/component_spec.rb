describe GitVersion::Component, type: :component do
  let(:instance) { described_class.new }

  it 'renders version' do
    allow(instance).to receive(:commit_version).and_return('12345')

    expect(output.css('code').to_html).to include('12345')
  end

  it 'renders time' do
    allow(instance).to receive(:commit_time).and_return(
      Time.utc(2021, 12, 24, 18, 0, 0),
    )

    expect(output.css('time').to_html).to include(
      'datetime="2021-12-24 18:00:00 UTC"',
    )
  end

  it 'enables Stimulus controller' do
    expect(output.css('time').to_html).to include('data-controller="timeago"')
  end

  private

  def output
    render_inline(instance)
  end
end
