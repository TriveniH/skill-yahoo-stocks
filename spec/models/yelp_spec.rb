describe Yelp do
  let( :params    ){{ category_filter:'sushi', location:'los angeles' }}
  let( :cache_key ){ 'search-sushi-los angeles-5' }

  specify 'caches' do
    Yelp.search_for params

    expect( Redis.new.get( cache_key )).to eq yelp_response
  end

  context 'When do_not_cache key is set' do
    specify do
      Yelp.search_for params.merge( do_not_cache:true )

      expect( Redis.new.get( cache_key )).to eq nil
    end
  end
end