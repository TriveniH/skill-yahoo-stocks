require "open-uri"
require "json"

require_relative "Utils"

class Stocks
  extend Cacheable
  
  DOMAIN = 'https://query.yahooapis.com/v1/public/yql'

  class << self
    def search_for params

      descriptionParams = retrieve_params(params)
      query = descriptionParams.companySymbol
      puts "before apirequest: query:  "+ query
      request = APIRequest.new( :generic, DOMAIN )
      uri = "?q=select * from yahoo.finance.quotes where symbol =\"#{query}\"&diagnostics=true&env=http://datatables.org/alltables.env&format=json&callback="
      puts "uri: "+ uri

      response = request.for( :get, uri, '')

      body = response.body
      set_cache cache_key_for( params ), body

      Utils.prepare_response(JSON.parse( body, symbolize_names:true ))
    end

=begin
    queries for year high and low based on the parameters
=end
    def search_for_year params
      descriptionParams = retrieve_params(params)
      query = descriptionParams.companySymbol
      puts "before apirequest: query:  "+ query
      request = APIRequest.new( :generic, DOMAIN )
      uri = "?q=select * from yahoo.finance.quotes where symbol =\"#{query}\"&diagnostics=true&env=http://datatables.org/alltables.env&format=json&callback="
      puts "uri: "+ uri

      response = request.for( :get, uri, '')

      body = response.body
      set_cache cache_key_for( params ), body
      Utils.prepare_response(JSON.parse( body, symbolize_names:true ))
    end


=begin
    queries for year high and low based on the parameters
=end
    def search_for_market params
      descriptionParams = retrieve_params(params)
      query = descriptionParams.getExchangeSymbol
      puts "before apirequest: query:  "+ query
      request = APIRequest.new( :generic, DOMAIN )
      uri = "?q=select * from yahoo.finance.quotes where symbol =\"#{query}\"&diagnostics=true&env=http://datatables.org/alltables.env&format=json&callback="
      puts "uri: "+ uri

      response = request.for( :get, uri, '')

      body = response.body
      set_cache cache_key_for( params ), body
      Utils.prepare_response(JSON.parse( body, symbolize_names:true ))
    end

    private

    def retrieve_params params
      descriptionParams = DescriptionParams.new
      descriptionParams.retrieve_params params
      return descriptionParams
    end
    
    private

    def request_params_for params

      {q: "select * from yahoo.finance.quotes where symbol = \"" + params[ :companyName ] +"\"",
        diagnostics:"true",
        env:"store://datatables.org Falltableswithkeys" }
    end

    def cache_key_for params
      return if params[ :not_cached ]

      "search-#{ params.sort.to_h.values.join '-' }-#{ LIMIT }"
    end
end
end