# Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
# The solution set must not contain duplicate triplets.

nums = [-1, 0, 1, 2, -1, -4]

# A solution set is:
# [
#   [-1, 0, 1],
#   [-1, -1, 2]
# ]

# @param {Integer[]} nums
# @return {Integer[][]}

def three_sum(nums)
  hash = Hash.new
  nums.each.with_index { |el, i| hash[el] = i }
  hash_keys = hash.keys
  res = []
  0.upto(hash_keys.size-2) do |i|
    (i+1).upto(hash_keys.size-1) do |j|
      comp = - (hash_keys[i] + hash_keys[j]) 
      # puts "i :#{i} and j: #{j}, and comp: #{comp}"
      if hash.include?(comp) && hash[comp] != i && hash[comp] > j
        # puts "yes"
        res << [hash_keys[i], hash_keys[j], comp]
        
      end
    end
  end
  res

end

p three_sum(nums)