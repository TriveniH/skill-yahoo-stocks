def parsed_response
  JSON.parse last_response.body, symbolize_names:true
end

def warning_header
  last_response.headers[ 'Warning' ]
end
