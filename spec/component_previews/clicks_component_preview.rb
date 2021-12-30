class ClicksComponentPreview < ViewComponent::Preview
  def with_default
    render(Clicks::Component.new(clicks: [click1, click2, click3], count: 1))
  end

  private

  def click1
    Click.new(
      ip: '1.1.1.1',
      user_agent: 'Mosaic/0.9',
      created_at: 5.minutes.ago,
    )
  end

  def click2
    Click.new(
      ip: '42.42.42.42',
      user_agent:
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:95.0) Gecko/20100101 Firefox/95.0',
      created_at: 9.minutes.ago,
    )
  end

  def click3
    Click.new(
      ip: '123.123.255.255',
      user_agent:
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) ' \
          'Chrome/81.0.4044.138 Safari/537.36',
      created_at: 10.minutes.ago,
    )
  end
end
