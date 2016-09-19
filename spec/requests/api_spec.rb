describe 'API Spec' do
  let( :params   ){{ category_filter:'sushi', location:'los angeles' }}
  let( :expected ){{ name:'KazuNori', image_url:'https://s3-media3.fl.yelpcdn.com/bphoto/9D63gCmIesyBQO15NNG9Xw/ms.jpg' }}

  before do
    WebMock.stub_request(:get, %r{http://api.yelp.com/v2/search})
      .to_return( status:200, body:File.read( 'spec/shared/yelp_response.json' ), headers:{} )
  end

  specify 'Search' do
    get '/search', params

    expect( last_response.status ).to eq 200
    expect( last_response.content_type ).to eq 'application/json'
    expect( parsed_response.first ).to eq expected
  end
end
