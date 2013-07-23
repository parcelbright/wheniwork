module WhenIWork
  class Configuration
    attr_accessor :endpoint, :username, :password,
      :api_key, :api_version, :protocol, :cache_store, :cache_enabled

    def initialize
      setup_base
    end

    def setup_base
      self.api_version   = '2'
      self.protocol      = 'https'
      self.cache_enabled = true
      self.cache_store   = ActiveSupport::Cache::MemoryStore.new
      self.endpoint      = "#{protocol}://api.wheniwork.com/#{api_version}/"
    end

  end
end
