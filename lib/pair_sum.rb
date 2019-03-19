# Given an array of integers, return all pairs 
# that sum up to a specified value k. List the 
# pairs in [min, max] order.


# pair_sum([1, 2, -1], 0)          // = [ [-1, 1] ]

# pair_sum([1, 2, -1, -1], 0)      // = [ [-1, 1] ]

# pair_sum([1, 2, -1, -1, -2], 0)  // = [ [-1, 1], [-2, 2] ]

# pair_sum([1, 2, -1, -1, -2], 1)  // = [ [-1, 2] ]

# pair_sum([1, 2, -1, -1, -2], -1) // = [ [-2, 1] ]


def pair_sum(arr, k)
  result = []
  
  arr.length.times do |i|
    arr[i+1..-1].each do |num|
      if arr[i] + num == k
        (arr[i] < num) ? (result << [arr[i], num])
         : (result << [num, arr[i]])
      end
    end
  end
  result
end

p pair_sum([1, 2, -1, -1], 0)