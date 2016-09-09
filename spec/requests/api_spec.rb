describe 'API Spec' do
  let( :params   ){{  }}
  let( :expected ){{ foo:'bar' }}

  specify 'closes DB connection ONCE after responding' do
    get '/search', params

    expect( last_response.status ).to eq 200
    expect( last_response.content_type ).to eq 'application/json'
    expect( parsed_response ).to eq expected
  end
end
