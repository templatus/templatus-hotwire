# Sidekiq must use a Redis database of its own: the cache store clears itself
# with FLUSHDB, which would otherwise drop every queued job along with it.
queue_url =
  ENV.fetch('REDIS_QUEUE_URL') { ENV.fetch('REDIS_URL', 'redis://localhost:6379/2') }

Sidekiq.configure_client { |config| config.redis = { url: queue_url } }

Sidekiq.configure_server { |config| config.redis = { url: queue_url } }
