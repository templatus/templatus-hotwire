# connection_pool 3.x expects keyword arguments, but some callers (e.g. ActiveSupport::Cache::RedisCacheStore)
# still pass a positional Hash. Ruby 3.4 no longer converts that implicitly, so patch in support.
unless defined?(ConnectionPoolKeywordCompat)
  require 'connection_pool'

  module ConnectionPoolKeywordCompat
    def initialize(*args, **kwargs, &)
      kwargs = args.first.merge(kwargs) if args.first.is_a?(Hash)
      super(**kwargs, &)
    end
  end

  ConnectionPool.prepend(ConnectionPoolKeywordCompat)
end
