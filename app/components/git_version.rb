class Components::GitVersion < Components::Base
  def initialize(commit_version:, commit_time:)
    super()
    @commit_version = commit_version
    @commit_time = commit_time
  end

  def view_template
    div do
      code(class: 'text-sm') { @commit_version }

      b(class: 'ml-3') do
        time(datetime: @commit_time, data: { controller: 'timeago' }) do
          @commit_time
        end
      end
    end
  end
end
