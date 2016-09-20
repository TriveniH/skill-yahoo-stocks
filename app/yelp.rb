class Yelp
  extend Cacheable
  
  DOMAIN = 'http://api.yelp.com'

  class << self
    def search_for params
      cache = get_cache( cache_key_for( params ))

      if cache
        return JSON.parse( cache, symbolize_names:true )
      end

      request = APIRequest.new( :oauth1, DOMAIN )
      response = request.for( :get, '/v2/search', request_params_for( params ))

      body = response.body
      set_cache cache_key_for( params ), body

      JSON.parse( body, symbolize_names:true )
    end


    private

    def request_params_for params
      { location:params[ :location ],
        category_filter:params[ :category_filter ],
        limit:LIMIT }
    end

    def cache_key_for params
      return if params[ :not_cached ]

      "search-#{ params.sort.to_h.values.join '-' }-#{ LIMIT }"
    end
  end
end