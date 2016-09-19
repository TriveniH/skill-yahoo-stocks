class APIRequest
  def initialize auth_type, domain, headers={}, params={}
    @auth_type = auth_type
    @domain = domain
    @headers = headers
    @params = params
  end

  def for method, path
    case @auth_type
    when :oauth_1
      oauth_1_request method, path
    end
  end


  private

  def oauth_1_request method, path
    oauth_1_access_token.request method, path
  end

  def oauth_1_access_token
    consumer = OAuth::Consumer.new( ENV[ 'CONSUMER_KEY' ], ENV[ 'CONSUMER_SECRET' ],
                { site:@domain, signature_method:'HMAC-SHA1', scheme: :header })

    OAuth::AccessToken.new( consumer, ENV[ 'TOKEN' ], ENV[ 'TOKEN_SECRET' ])
  end
end
