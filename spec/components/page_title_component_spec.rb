require 'rails_helper'

describe PageTitleComponent, type: :component do
  it 'renders title' do
    expect(
      render_inline(described_class.new('Hello, world!')).css('h1').to_html,
    ).to include('Hello, world!')
  end
end
