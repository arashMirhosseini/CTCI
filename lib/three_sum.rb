#Given an array nums of n integers, are there 
#elements a, b, c in nums such that a + b + c = 0? 
#Find all unique triplets in the array which gives 
#the sum of zero.

#The solution set must not contain duplicate triplets.

# example:

# Given array nums = [-1, 0, 1, 2, -1, -4],

# A solution set is:
# [
#   [-1, 0, 1],
#   [-1, -1, 2]
# ]
require 'set'
def three_sum(nums)
  
end

def two_sum(nums, target)
  seen = Set.new
  result = Set.new

  0.upto(nums.length-1) do |i|
    val = target - nums[i]
    if seen.include?(val)
      (nums[i] > val) ? 
        result.add([val, nums[i]]) :
        result.add([nums[i], val])
      
    end
    seen.add(nums[i])
  end
  result
end

p two_sum([-1, 0, 1, 2, -1 ,4], 0)
