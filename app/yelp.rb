class Yelp
  extend Cacheable

  class << self
    def search_for params
      response = access_token.get( "/v2/search?#{ url_params_from( params )}" ).body

      unless params[ :do_not_cache ]
        key = "search-#{ params.sort.to_h.values.join '-' }-#{ LIMIT }"
        set_cache key, response
      end

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
  end
end