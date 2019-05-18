# Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).

# Example:

s = "ADOBECODEBANC"
t = "ABC"
# Output: "BANC"

def min_window(s, t)
  left, right = [0, 0]
  counter = t.size
  res = []
  hash = Hash.new(0)
  t.each_char { |c| hash[c] += 1 }

  while right < s.size
    if hash.include? s[right]
      counter -= 1 if hash[s[right]] > 0
      hash[s[right]] -= 1 
      
    end
    right += 1
    while counter == 0
      res << s[left...right]
      if hash.include? s[left]
        counter += 1 if hash[s[left]] >= 0
      
        hash[s[left]] += 1
      end
        
      left += 1
    end
    
  end
  res
end

# max sliding window
# Given an array nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position. Return the max sliding window.
require 'rubygems'
require 'algorithms'
include Containers
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
  return [] if nums.empty?
  
  window = nums[0...k]
  max = window.max
  res = [max]
  idx = k
  while idx < nums.size
    if nums[idx] > max
      max = nums[idx]
    end
    res << max
    idx += 1
  end
  res
end

nums = [1,3,-1,-3,5,3,6,7]
k1 = 3
# Output: [3, 3, 5, 5, 6, 7] 
p max_sliding_window(nums, k1)