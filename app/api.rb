set :raise_errors, true
set :show_exceptions, false

before do
    content_type 'application/json'
  end

get '/search' do
  { foo:'bar' }.to_json
end