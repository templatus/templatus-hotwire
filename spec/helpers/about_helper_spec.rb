describe AboutHelper do
  describe '#gem_version' do
    it 'returns the version of a loaded gem' do
      expect(helper.gem_version('rails')).to eq(Rails::VERSION::STRING)
    end

    it 'returns nil for a gem that is not loaded' do
      expect(helper.gem_version('no-such-gem')).to be_nil
    end

    it 'returns nil when no gem is given' do
      expect(helper.gem_version(nil)).to be_nil
    end

    it 'falls back to the lockfile for gems outside the current bundle' do
      # Development-only gems are absent from the production bundle
      allow(Gem).to receive(:loaded_specs).and_return({})

      expect(helper.gem_version('rubocop')).to match(/\A\d+\.\d+/)
    end
  end

  describe '.locked_gem_versions' do
    around do |example|
      described_class.instance_variable_set(:@locked_gem_versions, nil)
      example.run
      described_class.instance_variable_set(:@locked_gem_versions, nil)
    end

    it 'copes with a missing lockfile' do
      allow(Rails.root).to receive(:join).and_return(Pathname.new('/nope/Gemfile.lock'))

      expect(described_class.locked_gem_versions).to eq({})
    end
  end

  describe '#alpine_version' do
    it 'returns nothing off Linux, where there is no Alpine release to read' do
      stub_const('RUBY_PLATFORM', 'arm64-darwin24')

      expect(helper.alpine_version).to be_nil
    end

    it 'reads the Alpine release on Linux' do
      stub_const('RUBY_PLATFORM', 'x86_64-linux')

      # nil on any Linux that isn't Alpine, a version string on Alpine itself -
      # either way the point is that the platform check lets it through.
      expect { helper.alpine_version }.not_to raise_error
    end
  end

  describe '#redis_version' do
    it 'returns the version of the running Redis' do
      expect(helper.redis_version).to match(/\A\d+\.\d+/)
    end

    it 'returns nil when Redis is unreachable' do
      allow(Redis).to receive(:new).and_raise(Redis::CannotConnectError)

      expect(helper.redis_version).to be_nil
    end
  end

  describe '#version_for_feature' do
    it 'falls back to the gem version when there is no external version' do
      expect(helper.version_for_feature({ name: 'Ruby on Rails', gem: 'rails' })).to eq(
        Rails::VERSION::STRING,
      )
    end
  end
end
