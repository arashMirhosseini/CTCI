def max_profit(prices)
  return 0 if prices.size < 2
  p = 0
  if prices[1] > prices[0]
    p = prices[1] - prices[0]
  end
  return p + max_profit(prices[1..-1])
end


def rotate(nums, k)
  start = 0
  k = k % nums.size

  count = 0
  while count < nums.size
    curr = start
    prev = nums[start]
    loop do
      n = (curr+k) % nums.size
      # temp, nums[n] = nums[n], temp
      temp = nums[n];
      nums[n] = prev;
      prev = temp;

      curr = n
      count += 1
     
      break if curr == start
    end
    start += 1
  end
  p nums
end


def intersect(nums1, nums2)
  result = []
  h1 = Hash.new(0)
  h2 = Hash.new(0)
  nums1.each { |n| h1[n] += 1 }
  nums2.each { |n| h2[n] += 1 }

  h1.each do |k1, v1|
    if h2.include? k1
      diff = [v1,h2[k1]].min

      # diff = v1 if diff == 0 
      diff.times { result << k1 }
    end
  end
  p h1[2]
  p h2[2]

  result
  
end

def move_zeroes(nums)
  i = 0
  while i < nums.size
    break if nums[i] == 0
    i += 1
  end
  j = i + 1
  while j < nums.size
    if nums[j] != 0
      nums[j], nums[i] = nums[i], nums[j]
      i += 1
    end
    
    j += 1
  end
  nums
end

l1 = [43,85,49,2,83,2,39,99,15,70,39,27,71,3,88,5,19,5,68,34,7,41,84,2,13,85,12,54,7,9,13,19,92]
l2 = [10,8,53,63,58,83,26,10,58,3,61,56,55,38,81,29,69,55,86,23,91,44,9,98,41,48,41,16,42,72,6,4,2,81,42,84,4,13]
# [1,2,2,1]
# [2]
# p intersect(l1, l2)
# p intersect([1,2,2,1],[2])
p move_zeroes([1])
# rotate([1,2], 3)

# p max_profit([7,6,4,3,1])
