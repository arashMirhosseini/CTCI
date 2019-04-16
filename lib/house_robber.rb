# house robber

# Input  : nums = [6, 7, 1, 3, 8, 2, 4]
# Output : 19
# Thief will steal 6, 1, 8 and 4 from house.

# Input  : nums = [5, 3, 4, 11, 2]
# Output : 16
# Thief will steal 5 and 11

# Input  : nums = [6,6,4,8,4,3,3,10]
# Output : 27
# Thief will steal 6, 8, 3, 10

def rob(nums)
  robs_so_far = []
  robs_so_far[0] = nums[0]
  robs_so_far[1] = [robs_so_far[0], nums[1]].max
  2.upto(nums.size-1) do |i|
    robs_so_far[i] = [nums[i]+robs_so_far[i-2], robs_so_far[i-1]].max

  end
  robs_so_far[-1]
end

def sliding_max_window(nums, k)
  deque = []
  res = []
  0.upto(k-1) do |i|
    while !deque.empty? && nums[i] > deque[-1]
      deque.pop
    end
    deque << nums[i]
  end
  res << deque.first
  k.upto(nums.size-1) do |i|

    while !deque.empty? && nums[i] > deque[-1]
      deque.pop
    end
    deque << nums[i]
    res << deque.first
  end
end

def is_prime?(n)
  (2..n-1).all? { |num| n % num != 0 }
end

def is_valid(s)
  return false if s.size % 2 != 0
  hash = {'(' => ')', '{' => '}', '[' => ']'}
  stack = []
  
  s.each_char do |brkt|
    p stack
    if hash.include? brkt
      stack.push(brkt)
    else
      # p  hash[stack.last]
      if hash[stack.last] != brkt
        return false
      else
        stack.pop
      end
    end
  end
  true
end

p is_valid('{[]}')

# p is_prime?(2)
# p rob([6,6,4,8,4,3,3,10])
