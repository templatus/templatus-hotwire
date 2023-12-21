if Rails.configuration.x.rorvswild.api_key
  RorVsWild.start(
    api_key: Rails.configuration.x.rorvswild.api_key,
    deployment: {
      revision: Rails.configuration.x.git.commit_version,
    },
  )
end
