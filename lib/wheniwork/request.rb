module WhenIWork
  module Request

    def get(path, params={}, options={})
      request :get, path, default_request_params.merge(params), options
    end

    def post(path, params={}, options={})
      request :post, path, default_request_params.merge(params), options
    end

    def request(method, path, params, cache_options)
      if cache.nil?
        connection.send(method, path, params).body
      else
        key = cache_options.delete(:key) || cache_key_for(path, params)
        options = default_options.merge(cache_options)

        cache.fetch(key, options) do
          connection.send(method, path, params).body
        end

      end
    end

    def cache_key_for(uri, params)
      params[:uri] = uri
      ::Marshal.dump(params)
    end

    def default_options
      { expires_in: 60 }
    end

    def connection
      @connection ||= Faraday.new(:url => endpoint) do |faraday|
        faraday.request  :url_encoded

        faraday.response :logger
        faraday.response :json, :content_type => /\bjson$/
        faraday.adapter  Faraday.default_adapter
      end
    end

    def default_request_params
      { "W-Token" => token }
    end

    def endpoint
      WhenIWork.configuration.endpoint
    end

    def token
      if cache.nil?
        login['token']
      else
        cache.fetch('wheniwork_token', default_options) do
          login['token']
        end
      end
    end

    def auth_params
      {
        username: WhenIWork.configuration.username,
        password: WhenIWork.configuration.password,
        key:      WhenIWork.configuration.api_key
      }
    end

    def login
      connection.post('login', auth_params.to_json).body
    end

    def cache
      WhenIWork.configuration.cache
    end
  end
end
