set :raise_errors, true
set :show_exceptions, false

URL   = 'http://api.yelp.com'
LIMIT = 1

before do
  content_type 'application/json'
end

get '/search' do
  response = access_token.get( "/v2/search?#{ url_params }" ).body

  parsed = JSON.parse( response, symbolize_names:true )
  
  parsed[ :businesses ].map do | business |
    { name:     business[ :name      ],
      image_url:business[ :image_url ]}
  end.to_json
end


def access_token
  consumer = OAuth::Consumer.new( ENV[ 'CONSUMER_KEY' ], ENV[ 'CONSUMER_SECRET' ],
              { site:URL, signature_method:'HMAC-SHA1', scheme: :header })

  OAuth::AccessToken.new( consumer, ENV[ 'TOKEN' ], ENV[ 'TOKEN_SECRET' ])
end

def url_params
  Rack::Utils.build_query( location:params[ :location ],
                           category_filter:params[ :category_filter ],
                           limit:LIMIT )
end
