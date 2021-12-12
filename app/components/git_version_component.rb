class GitVersionComponent < ViewComponent::Base
  def commit_version
    Rails.configuration.x.git.commit_version
  end

  def commit_time
    Rails.configuration.x.git.commit_time
  end
end
