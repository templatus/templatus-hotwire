class GitVersionComponentPreview < ViewComponent::Preview
  def with_default
    render(
      GitVersion::Component.new(
        commit_version: 'abc1234',
        commit_time: Time.current.utc.to_s,
      ),
    )
  end
end
