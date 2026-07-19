describe Click::Component, type: :component do
  subject(:output) { render_inline(described_class.new(click:)) }

  let(:click) do
    build_stubbed(:click,
                  user_agent:,
                  ip: '203.0.113.7',
                  created_at: Time.zone.parse('2025-09-16 10:54'))
  end

  context 'with a desktop browser' do
    let(:user_agent) do
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 ' \
        '(KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36'
    end

    # Only the major version is shown, and the frozen "OS X 10.15.7" becomes macOS
    it { is_expected.to have_text('Chrome 150') }
    it { is_expected.to have_text('macOS') }
    it { is_expected.to have_no_text('150.0.0.0') }
    it { is_expected.to have_css("[data-tip='#{user_agent}']") }
    it { is_expected.to have_css("time.tooltip[data-tip='September 16, 2025 10:54']") }
    it { is_expected.to have_css('code', text: '203.0.113.7') }
    it { is_expected.to have_css('time[data-controller="timeago"]') }
  end

  context 'with a mobile browser' do
    let(:user_agent) do
      'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 ' \
        '(KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1'
    end

    it { is_expected.to have_text('Safari 17') }
    it { is_expected.to have_text('iOS 17.0') }
  end

  context 'when the agent carries no platform' do
    let(:user_agent) { 'curl/8.4.0' }

    it { is_expected.to have_text('curl 8') }
  end

  context 'when the agent is unparseable' do
    let(:user_agent) { '???' }

    it 'still renders the row' do
      expect(output).to have_css('li[data-click-id]')
    end
  end
end
