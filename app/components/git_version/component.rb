class GitVersion::Component < ViewComponent::Base
  def initialize(commit_version:, commit_time:)
    super
    @commit_version = commit_version
    @commit_time = commit_time
  end

  attr_reader :commit_version, :commit_time
end
