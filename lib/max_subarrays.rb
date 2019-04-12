# Given an array and an integer k, find the maximum for each and every contiguous subarray of size k.

arr = [1, 2, 3, 1, 4, 5, 2, 3, 6]
k = 3
# Output :
# 3 3 4 5 5 5 6

# O(n^2)
def kSubMax(arr, k)
  i = 0
  j = i + k - 1
  res = []
  while j < arr.size
    res << arr[i..j].max
    j += 1
    i += 1
  end
  res
end

# use queue O(n)
def k_sub_max(arr, k)
  que = []
  res = []
  for i in 0...k do
    que.push(arr[i])
  end
  res << que.max
  for j in k...arr.size do 
    
    que.shift
    que.push(arr[j])
    res << que.max
  end

  res
end

# p kSubMax(arr, k)
p k_sub_max(arr, k)


