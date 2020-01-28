def stock_picker(array)
	best_days = []
	biggest_difference = 0
	buy = 0
	sell = 0
	array.reverse!
	array.each do |n|
		array[array.index(n)..-1].each do |i|
			profit = n - i
			if profit > biggest_difference
				biggest_difference = profit
				buy = i
				sell = n
			end
		end
	end
	array.reverse!
	if buy == 0 && sell == 0
	puts "Do not buy!"
	else
	best_days << array.index(buy)
	best_days << array.index(sell)
	end
p best_days

end

stock_picker([17,3,6,9,15,8,6,1,10])