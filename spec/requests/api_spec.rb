describe 'API Spec' do
  let( :params   ){{  category_filter:'sushi', location:'los angeles' }}
  let( :expected ){{ name:'KazuNori', image_url:'https://s3-media3.fl.yelpcdn.com/bphoto/9D63gCmIesyBQO15NNG9Xw/ms.jpg' }}

  specify 'Search' do
    get '/search', params

    expect( last_response.status ).to eq 200
    expect( last_response.content_type ).to eq 'application/json'
    expect( parsed_response.first ).to eq expected
  end
end
