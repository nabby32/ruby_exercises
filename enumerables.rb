module Enumerable

	# Call a method on each element.
	def my_each
		self.length.times do |index|
			yield(self[index])
		end
	end

	#Call a method on each element and return result, with index.
	def my_each_with_index
		self.length.times do |index|
			yield(self[index], index)
		end
	end

	#Return an array of elements matching condition of given block.
	def my_select
		return_array = []
		self.my_each do |element|
			if yield(element) == true
				return_array << element
			end
		end
		return return_array
	end

	#Return true if all elements match block condition.
	def my_all?
		value = true
		self.my_each do |element|
			if yield(element) != true
				value = false
			end
		end
		return value
	end

	#Return true if any elements match block condition.
	def my_any?
		value = false
		self.my_select do |element|
			if yield(element)
				value = true
			end
		end
		return value
	end

	#Return true if no elements match the block condition.
	def my_none?
		value = true
		self.my_each do |element|
			if yield(element) == true
				value = false
			end
		end
		return value
	end

	#Return length, or number of elements equal to a given paramater,
	#or number of elements matchibg block condition.
	def my_count (param=nil, &user_block)
		if param
			count = 0
			self.my_each do |x|
				x == param ? count += 1 : next
			end
			return count
		elsif user_block
			block_count = 0
			self.my_each do |element|
				user_block.call(element) == true ? block_count += 1 : next
			end
			return block_count
		else 
			return self.length
		end
	end


end

