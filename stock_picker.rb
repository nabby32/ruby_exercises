def stock_picker(day_array)
	answer = []
	profit = 0
	
	day_array.each do |day|
		#Get place of day in the array.
		place = day_array.index(day)
		#Check numbers after the day in question for smaller values.
		while place < day_array.length
			#If smaller values result in larger profit, update max profit value and the days to achieve it.
			if (day_array[place] - day) > profit
				profit = day_array[place] - day
				answer.clear
				answer.push(day_array.index(day))
				answer.push(place)
			end
			#Advance to the next day.
			place += 1
		end
	end
	if profit > 0
		return "Your best bet was to buy on day #{answer[0]} and sell on day #{answer[1]} for a profit of $#{profit} per share."
	elsif profit == 0
		return "Hopefully you didn't buy this, because it only went down--no profit to be made."
	end
end

def stock_picker_rev(price_array)
	profit = 0
	days = []
	price_array.each do |buy_price|
		price_array[price_array.index(buy_price)..-1].each do |sell_price|
			if sell_price - buy_price > profit
				profit = sell_price - buy_price
				days[0], days[1] = price_array.index(buy_price), price_array.index(sell_price)
			end
		end
	end
	p "You were best buying on day #{days[0]} and selling/ on day #{days[1]} for a profit of $#{profit}."		
end
