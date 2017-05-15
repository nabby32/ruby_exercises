def caesar_cipher(string, shift)
	characters = string.split("")
	new_array = []

	characters.each do |letter|
		order = letter.ord
		#Determine if lower case letter
		if (order > 96 && order < 123)
			#Wrap around z to a, if needed
			if ((order + shift) > 122)
				order = ((order + shift) - 122) + 96
			else
				order += shift
			end
		#Determine if upper case letter
		elsif (order > 64 && order < 91)
			#Wrap around z to a, if needed
			if ((order + shift) > 90)
				order = ((order + shift) - 90) + 64
			else
				order += shift
			end
		#Determine if not a letter
		else
			order
		end
	#Push new letters to new array	
    new_array << order.chr
	end
	#Form new string from array
	new_string = new_array.join("")
	return new_string
end




