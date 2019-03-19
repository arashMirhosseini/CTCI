require 'set'
# Given an array of integers, return all pairs 
# that sum up to a specified value k. List the 
# pairs in [min, max] order.


# pair_sum([1, 2, -1], 0)          // = [ [-1, 1] ]

# pair_sum([1, 2, -1, -1], 0)      // = [ [-1, 1] ]

# pair_sum([1, 2, -1, -1, -2], 0)  // = [ [-1, 1], [-2, 2] ]

# pair_sum([1, 2, -1, -1, -2], 1)  // = [ [-1, 2] ]

# pair_sum([1, 2, -1, -1, -2], -1) // = [ [-2, 1] ]

# naive approach: O(n^2)
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
  result.uniq
end

# use set: O(n)
def pair_sum1(arr, k)
  seen = Set.new
  result = Set.new
  # result1 = []

  arr.each do |num|
    target = k - num
    if seen.include?(target)
      result.add([[num, target].min, [num, target].max])
      # result1 << [[num, target].min, [num, target].max]
    end
    seen.add(num)
  end
  result
end

# use sorting: O(n log n)
def pair_sum2(arr, k)
  arr.sort!
  result = []
  l = 0
  r = arr.length - 1
  while l < r
    val = arr[l] + arr[r]
    if val == k
      result << [[arr[l],arr[r]].min, [arr[l],arr[r]].max]
      l += 1
      r -= 1
    elsif val < k
      l += 1
    else
      r -= 1
    end
  end
  result.uniq
end

p pair_sum2([1, 2, -1, -1, -2], 0)