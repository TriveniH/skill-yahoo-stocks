class Yelp
  extend Cacheable
  

  class << self
    def search_for params
      cache = get_cache( cache_key_for( params ))

      if cache
        return JSON.parse( cache, symbolize_names:true )
      end

      response = access_token.get( "/v2/search?#{ url_params_from( params )}" ).body

      set_cache cache_key_for( params ), response

      parsed = JSON.parse( response, symbolize_names:true )
    end


    private

    def access_token
      consumer = OAuth::Consumer.new( ENV[ 'CONSUMER_KEY' ], ENV[ 'CONSUMER_SECRET' ],
                  { site:URL, signature_method:'HMAC-SHA1', scheme: :header })

      OAuth::AccessToken.new( consumer, ENV[ 'TOKEN' ], ENV[ 'TOKEN_SECRET' ])
    end

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