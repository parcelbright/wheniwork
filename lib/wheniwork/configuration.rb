module WhenIWork
  class Configuration
    attr_accessor :endpoint, :username, :password,
      :api_key, :api_version, :protocol, :cache

    def endpoint
      @endpoint ||= "#{protocol}://api.wheniwork.com/#{api_version}/"
    end

    def api_version
      @api_version ||= '2'
    end

    def protocol
      @protocol ||= 'https'
    end

    def cache
      @cache ||= ActiveSupport::Cache::MemoryStore.new
    end

  end
end
