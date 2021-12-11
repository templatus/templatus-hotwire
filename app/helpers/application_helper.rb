module ApplicationHelper
  def versions
    {
      alpine: alpine_version,
      ruby: ruby_version,
      rails: rails_version,
      puma: puma_version,
      postgres: postgres_version,
      redis: redis_version,
      sidekiq: sidekiq_version,
    }
  end

  private

  def alpine_version
    `cat /etc/alpine-release 2>/dev/null`.chomp
  end

  def ruby_version
    RUBY_VERSION
  end

  def rails_version
    Rails.version
  end

  def puma_version
    Puma::Const::PUMA_VERSION
  end

  def postgres_version
    ActiveRecord::Base.connection.select_value('SHOW server_version;')
  end

  def redis_version
    Redis.new.info['redis_version']
  end

  def sidekiq_version
    Sidekiq::VERSION
  end
end
