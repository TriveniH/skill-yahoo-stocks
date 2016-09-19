set :raise_errors, true
set :show_exceptions, false

LIMIT = 5

before do
  content_type 'application/json'
end

get '/search' do
  response = Yelp.search_for( params )

  response[ :businesses ].map do | business |
    { name:     business[ :name      ],
      image_url:business[ :image_url ]}
  end.to_json
end
