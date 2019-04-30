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

def three_sum(nums)
  nums.sort!
  res = []
  for i in 0...nums.size-2 do 
    next if i > 0 && nums[i] == nums[i-1]
    puts "i: #{i}"
    for j in i+1...nums.size-1 do 
      next if j > i+1 && nums[j] == nums[j-1]
      puts "j: #{j}"
      for k in j+1...nums.size do 
        next if k > j+1 && nums[k] == nums[k-1]
        puts "k: #{k}"
        if nums[i] + nums[j] + nums[k] == 0
          res << [nums[i], nums[j], nums[k]]
        end
      end
    end
  end
  res
end

nums = [-1, 0, 1, 2, -1, -4]
p three_sum(nums)
