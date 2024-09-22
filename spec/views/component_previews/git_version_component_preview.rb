class GitVersionComponentPreview < ViewComponent::Preview
  def with_default
    render(
      GitVersionComponent.new(
        commit_version: 'abc1234',
        commit_time: Time.current.utc.to_s,
      ),
    )
  end
end
