# Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
# The solution set must not contain duplicate triplets.

# nums = [-1, 0, 1, 2, -1, -4]

# A solution set is:
# [
#   [-1, 0, 1],
#   [-1, -1, 2]
# ]
# require 'set'
# @param {Integer[]} nums
# @return {Integer[][]}

# brute force solution
# time: O(n^3)
# space: O(1)
def three_sum_brt(nums)
  res = []
  nums.sort!
  for i in 0..nums.size-3 do 
    next if i > 0 && nums[i] == nums[i-1]
    for j in i+1..nums.size-2 do 
      next if j> i+1 && nums[j] == nums[j-1]
      for k in j+1..nums.size-1 do 
        next if k > j+1 && nums[k] == nums[k-1]
        if nums[i] + nums[j] + nums[k] == 0
          res << [nums[i], nums[j], nums[k]]
        end
      end
    end
  end
  res
end

# time: O(n^2)
# space O(n)
def three_sum_n2(nums)
  hash = Hash.new
  res = []
  nums.sort!
  nums.each.with_index { |el, i| hash[el] = i }
  for i in 0..nums.size-2 do 
    next if i > 0 && nums[i] == nums[i-1]
    for j in i+1..nums.size-1 do 
      next if j > i+1 && nums[j] == nums[j-1]
      complement = - (nums[i] + nums[j])
      if hash.include?(complement) && hash[complement] > j
        res << [nums[i], nums[j], complement]
      end
    end
  end
  res
end

# time: O(n logn)
# space: O(1)
def three_sum(nums)
  nums.sort!
  res = []
  for i in 0..nums.size-3
    next if i > 0 && nums[i] == nums[i-1]
    left = i + 1
    right = nums.size - 1
    target = - nums[i]
    while left < right
      if nums[left] + nums[right] == target
        res << [nums[i], nums[left], nums[right]]
        left += 1
        right -= 1
        left += 1 while nums[left] == nums[left-1]
        right -= 1 while nums[right] == nums[right+1]
      elsif  nums[left] + nums[right] < target
        left += 1
        left += 1 while nums[left] == nums[left-1]
      else
        right -= 1
        right -= 1 while nums[right] == nums[right+1]
      end
    end
    
  end
  res
end

