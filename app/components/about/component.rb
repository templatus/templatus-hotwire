class About::Component < ViewComponent::Base
  def features
    filename = self.class._sidecar_files(['json']).first
    file = File.read(filename)
    JSON.parse(file)
  end

  def version(feature)
    {
      'Alpine Linux' => alpine_version,
      'PostgreSQL' => postgres_version,
      'Redis' => redis_version,
      'Ruby' => ruby_version,
    }[
      feature['name']
    ] || gem_version(feature['gem'])
  end

  private

  def alpine_version
    `cat /etc/alpine-release 2>/dev/null`.chomp.presence
  end

  def postgres_version
    ActiveRecord::Base.connection.select_value('SHOW server_version;')
  end

  def redis_version
    Redis.new.info['redis_version']
  end

  def ruby_version
    RUBY_VERSION
  end

  def gem_version(name)
    Gem.loaded_specs[name]&.version if name
  end
end
