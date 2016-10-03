set :raise_errors, true
set :show_exceptions, false

LIMIT = 5

before do
  content_type 'application/json'
end

get '/description' do
  response = Stocks.search_for( params )
  puts ".......................................\n"
  response.to_json
end

get '/description/yearhighlow' do
  response = Stocks.search_for_year( params )
  puts ".......................................\n"
  response.to_json
end

get '/description/market' do
  response = Stocks.search_for_market( params )
  puts ".......................................\n"
  response.to_json
end


get '/search' do
  response = Yelp.search_for( params )
  
  puts "hello"
  puts response
  response[ :businesses ].map do | business |
    { name:     business[ :name      ],
      image_url:business[ :image_url ]}
  end.to_json
end
