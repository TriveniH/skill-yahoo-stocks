describe 'API Spec' do
  let( :params    ){{ category_filter:'sushi', location:'los angeles' }}
  let( :expected  ){{ name:'KazuNori', image_url:'https://s3-media3.fl.yelpcdn.com/bphoto/9D63gCmIesyBQO15NNG9Xw/ms.jpg' }}
  let( :cache_key ){ 'search-sushi-los angeles-5' }

  specify 'Search' do
    get '/search', params

    expect( last_response.status ).to eq 200
    expect( last_response.content_type ).to eq 'application/json'
    expect( parsed_response.first ).to eq expected
  end

  specify 'Sets cache' do
    get '/search', params

    expect( Redis.new.get( cache_key )).to eq yelp_response
  end

  specify 'Sets cache expiry' do
    get '/search', params

    expect( Redis.new.ttl( cache_key )).to eq Cacheable::EXPIRY
  end

  specify 'Gets from cache' do
    get '/search', params
    get '/search', params

    expect( WebMock ).to have_requested( :get, %r{http://api.yelp.com/v2/search}).once
  end

  context 'When not_cached is true do not get from cache' do
    specify do
      get '/search', params.merge( not_cached:true )
      get '/search', params.merge( not_cached:true )

      expect( WebMock ).to have_requested( :get, %r{http://api.yelp.com/v2/search}).twice
    end
  end
end
