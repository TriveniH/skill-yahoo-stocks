class DescriptionParams
	include Utils
	attr_accessor :companyName, :exchangeName,
	:yearHigh, :yearLow, :pERatio,
	:marketCap, :volume,
	:companySymbol, :exchangeSymbol,
	:exchangeMarketNames,
	:exchangeMarketSymbols
	def initialize
	end

#write setters and getters for all variables.
	def set_exchangeName (exchangeName)
		exchangeMarketNames = {"nasdaq" => "NMS", "dowjones" => "DJI", "sp" => "SNP"}
		exchangeMarketSymbols = {"NMS" => "^IXIC", "DJI" => "^DJI", "SNP" => "^GSPC"}
		self.exchangeName = exchangeName
		self.exchangeSymbol = exchangeMarketSymbols[exchangeMarketNames[exchangeName]]
	end

	def set_companyName (companyName)
		if Utils.present(companyName)
			self.companyName = companyName
		end
	end

	def set_yearHigh (yearHigh)
		self.yearHigh = yearHigh
	end

	def set_yearLow (yearLow)
		self.yearLow = yearLow
	end

	def set_pERatio (pERatio)
		self.pERatio = pERatio
	end

	def set_marketCap (marketCap)
		self.marketCap = marketCap
	end

	def set_volume (volume)
		self.volume = volume
	end

	def retrieve_companySymbol
		if Utils.present(self.companyName)
			self.companySymbol = Utils.read_symbols(companyName, exchangeSymbol)
			puts "retrieve_companySymbol::: "+ self.companySymbol
		end
	end

	def getExchangeSymbol
		return exchangeSymbol
	end

	def retrieve_params params
      set_companyName(params["companyName"].to_s)
      exchangeName = params["exchangeName"].to_s
      yearLow = params["yearLow"].to_s
      yearHigh = params["yearHigh"].to_s
      puts "exchangeName:: "+ exchangeName.to_s
      puts Utils.present(exchangeName)
      if Utils.present(exchangeName)
        puts "exchangeName present::"
        set_exchangeName(exchangeName)
      end
      retrieve_companySymbol()

      if Utils.present(yearHigh)
      	yearHigh = true
      end

      if Utils.present(yearLow)
      	yearLow = true
      end
    end
end