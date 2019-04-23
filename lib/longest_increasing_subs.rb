# Longest Increasing Subsequence
# Given an unsorted array of integers, find the length of longest increasing subsequence.

# Example:

# Input: [10,9,2,5,3,7,101,18]
# Output: 4 
# Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4. 

# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
  inf = -1.0/0
  lis(nums, inf, 0)
end

def lis(nums, prev, curr)
  if curr >= nums.length
    return 0
  end

  taken = 0
  if nums[curr] > prev
    taken = 1 + lis(nums, nums[curr], curr+1)
  end

  not_taken = lis(nums, prev, curr + 1)

  [taken, not_taken].max
end

def length_of_lis1(nums)
  dp = Array.new(nums.size){1}
  max = 0
  1.upto(nums.size-1) do |i|
    0.upto(i-1) do |j|
      if nums[i] > nums[j]
        dp[i] = [dp[i], dp[j]+1].max
      end
    end
    max = [max, dp[i]].max
  end
  max
end

# arr = [0,1,2,3]
def bsearch(arr, target)
  # mid = (end1 - start + 1) / 2
  low = 0 
  high = arr.size - 1
  mid = (low+high) / 2
 
  if arr[mid] < target 
    # p arr[mid+1..-1]
    return bsearch(arr[mid+1..high], target)
  elsif arr[mid] > target
    # p arr[0..mid-1]
    return bsearch(arr[low..mid-1], target)
  else
    return mid
  end
  
end


def binary_search(arr, value, low, high)
  if high < low
    return nil
  end

  mid = (low + high) / 2
  if arr[mid] > value
    return binary_search(arr, value, low, mid - 1)
  elsif arr[mid] < value
    return binary_search(arr, value, mid+1, high)
  else
    return mid
  end
  
end

nums = [10,9,2,5,3,7,101,18]
p length_of_lis1(nums)