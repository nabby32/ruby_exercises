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

	#Return a new array with of values resulting from the passed block. If no
	#block, return original array.
	def my_map(&user_block)
		result = []
		if user_block
			self.my_each do |element|
				result << user_block.call(element)
			end
			return result
		else
			return self 
		end
	end

	#Return the combined value of an operation executed on the elements, either
	#with a block or a symbol. Initial value can be specified.
	def my_inject(initial=self[0], symbol=nil)
		return_value = initial
		if symbol
			self.my_each do |element|
				return_value = return_value.send(symbol, element)
			end
			puts return_value
		elsif block_given?
			self.length.times do |index|
				return_value += yield(return_value, self[index])
			end
			return return_value
		end
	end

	#Use my_inject to make a method which multiplies each element to the combined 
	#value as it goes along
	def multiply_els
		self.my_inject(self[0],:*)
	end


			


end

