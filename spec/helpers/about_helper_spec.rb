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
