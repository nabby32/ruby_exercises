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

prices = [999, 1000, 389, 71]

puts stock_picker(prices)

