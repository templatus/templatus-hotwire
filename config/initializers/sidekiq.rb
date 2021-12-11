Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/2') }
end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/2') }

  schedule = YAML.load_file('config/schedule.yml')
  Sidekiq::Cron::Job.load_from_hash(schedule) if schedule.present?
end
