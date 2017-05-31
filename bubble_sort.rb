def bubble_sort(array)
	(array.length - 1).times do 
		(array.length - 1).times do |index|
			if array[index] > array[index + 1]
				hold = array[index]
				array[index] = array[index + 1]
				array[index + 1] = hold
			end
		end
	end
	return array
end

def bubble_sorty(array)
	(array.length - 1).times do 
		(array[0...-1]).each do |element|
			index = array.index(element).to_i
			compare = array.index(element).to_i + 1
			if array[index] > array[compare]
				hold = array[index]
				array[index] = array[compare]
				array[compare] = hold
			end
		end
	end
	return array
end

def bubble_sort_by(array)
	(array.length - 1).times do 
		(array.length - 1).times do |index|
			if yield(array[index], array[index + 1]) > 0
				hold = array[index]
				array[index] = array[index + 1]
				array[index + 1] = hold
			end
		end
	end
	return array
end

puts bubble_sort_by([6, 2, 4, 1]) {|first, second| first - second}

