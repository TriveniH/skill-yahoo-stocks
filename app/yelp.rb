class Yelp
  extend Cacheable
  
  DOMAIN = 'http://api.yelp.com'

  class << self
    def search_for params
      cache = get_cache( cache_key_for( params ))

      if cache
        return JSON.parse( cache, symbolize_names:true )
      end

      request = APIRequest.new( :oauth_1, DOMAIN )
      response = request.for( :get, "/v2/search?#{ url_params_from( params )}" )

      body = response.body
      set_cache cache_key_for( params ), body

      parsed = JSON.parse( body, symbolize_names:true )
    end


    private

    def url_params_from params
      Rack::Utils.build_query( location:params[ :location ],
                               category_filter:params[ :category_filter ],
                               limit:LIMIT )
    end

    def cache_key_for params
      return if params[ :not_cached ]

      "search-#{ params.sort.to_h.values.join '-' }-#{ LIMIT }"
    end
  end
end