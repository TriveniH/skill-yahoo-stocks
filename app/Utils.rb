module Utils
	def Utils.read_symbols(companyName, exchangeSymbol)
      puts "reading symbols: "+ companyName.to_s
      uri = "http://d.yimg.com/autoc.finance.yahoo.com/autoc?query=#{companyName}&region=US&lang=en-US&callback=YAHOO.Finance.SymbolSuggest.ssCallback"
      puts uri
      conn = open(uri)
      result = conn.read
      result.sub!("YAHOO.Finance.SymbolSuggest.ssCallback(", "").chomp!(");")
      json_result = JSON.parse(result)
      puts "json_result::"+ json_result.to_s
      puts "exchangeSymbol::: "+ exchangeSymbol.to_s
      symbol = "YHOO"
      json_result["ResultSet"]["Result"].each do |row|
      	symbol = row["symbol"]
        	if exchangeSymbol==row["exch"]
        		puts "each item: "+ symbol
        		break
        	end
      end
      puts "symbol;;;"+ symbol
      if symbol.to_s != ''
       	return symbol.to_s
      end
    end

    def Utils.prepare_response(intial_response)
      puts "original response: "+ intial_response.to_s
      quote = intial_response[:query][:results][:quote]
      {symbol: quote[:symbol],
       name:quote[:Name],
       lastTradeDate: quote[:LastTradeDate],
       yeahLow:quote[:YearLow],
       yearHigh:quote[:YearHigh],
       percentChange:quote[:PercentChange],
       currency:quote[:Currency],
       change_PercentChange:quote[:Change_PercentChange],
       open:quote[:Open],
       previousClose:quote[:PreviousClose],
       pERatio:quote[:PERatio],
       daysLow:quote[:DaysLow],
       daysHigh:quote[:DaysHigh],
       lastTradeWithTime:quote[:LastTradeWithTime],
       changeinPercent:quote[:ChangeinPercent],
       volume:quote[:Volume]
      }
    end

    def Utils.blank str
    	str.to_s.strip == ''
    end

    def Utils.present str
    	! blank( str )
	end

end