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

# // initially called with low = 0, high = N-1
#   BinarySearch(A[0..N-1], value, low, high) {
#       // invariants: value > A[i] for all i < low
#                      value < A[i] for all i > high
#       if (high < low)
#           return not_found // value would be inserted at index "low"
#       mid = (low + high) / 2
#       if (A[mid] > value)
#           return BinarySearch(A, value, low, mid-1)
#       else if (A[mid] < value)
#           return BinarySearch(A, value, mid+1, high)
#       else
#           return mid
#   }

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
# nums = [10,9,101,18]
# p length_of_lis(nums)
arr = [1,3,4,5,6,7]
p bsearch(arr, 4)
# mid = 3
# [1,3,4]
# bsearch(arr, 0, 2, 4)
# mid = 1
# bsearch(arr, 2, 2, 4)
# p binary_search(arr, 4, 0, 5)