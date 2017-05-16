def substring(string, array)
	str_array = string.downcase.split(/\s/)
	answer_hash = Hash.new(0)
	array.each do |word|
		answer_hash[word] = 0
	end


	array.each do |ary_word|
		str_array.each do |str_word|
			if str_word.include?(ary_word.downcase)
				answer_hash[ary_word] += 1
			end
		end
	end

	return answer_hash
end

		