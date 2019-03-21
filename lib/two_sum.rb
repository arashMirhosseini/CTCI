#Given an array of integers, return indices of the 
#two numbers such that they add up to a specific target.

#You may assume that each input would have 
#exactly one solution, and you may not use the 
#same element twice.

#Given nums = [11, 2, 7, 15], target = 9,
# Because nums[1] + nums[2] = 2 + 7 = 9,
# return [1, 2].

def two_sum(nums, target)
  seen = Hash.new

  0.upto(nums.length-1) do |idx|
    val = target - nums[idx]
    if seen.has_key?(val)
      p seen
      return [seen[val], idx]
    end
    # p seen
    seen[nums[idx]] = idx
    
  end

end

p two_sum([11,2,7,15], 9)