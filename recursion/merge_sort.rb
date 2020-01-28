def merge_sort(array)

	return array if array.length == 1

	n = array.length

	left = merge_sort(array[0..((n/2)-1)])

	right = merge_sort(array[n/2..-1])

	array2 = []

	(left.length + right.length).times do

		if left.empty? && right[0].class == Integer

			array2 << right.shift

		elsif right.empty? && left[0].class == Integer

			array2 << left.shift

		elsif right[0] < left[0]

			array2 << right.shift

		elsif left[0] < right[0]

			array2 << left.shift

		end

	end

	return array2

end





p merge_sort([14,4,20,1,3,7,15,9]) # => [1,3,4,7,9,14,15,20]

p merge_sort([6]) # => [6]

p merge_sort([4,22,88,1,99,203,6,16,25]) # => [1,4,6,16,22,25,88,99,203]