def substring(string, array)
	str_array = string.downcase.split(/\s/)
	answer_hash = Hash.new(0)
	array.each do |word|
		answer_hash[word] = 0
	end
	#This is an inefficient split since the functions above and 
	#below are the same: array.each.

	array.each do |ary_word|
		str_array.each do |str_word|
			if str_word.include?(ary_word.downcase)
				answer_hash[ary_word] += 1
			end
		end
	end

	return answer_hash
end

def substring_rev(string, array)
	str_ary = string.downcase.split(/\s/)
	return_hash = {}

	array.each do |element|
		element.downcase!
		return_hash[element] = 0
		str_ary.each do |word|
			word.include?(element) ? return_hash[element] += 1 : next
		end
	end
	return return_hash
end

		