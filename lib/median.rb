# Given two sorted arrays, find the median element amongst the two arrays. That is, 
# if both arrays were combined, find the median element from the combined array. 
# Assume that there is not enough memory to actually combine both arrays. 
# There exists an O(log n + log m) solution.

# arr1 = [20,30,80]  -- [3,30,80]
# arr2 = [3, 9, 70] -- [20, 9, 70] 

# arr = [3, 9, 20, 30, 70, 80]  --- return 25
     # arr1 = [3, 9, 20]
     # arr2 = [30, 70, 80]
# 


def median(arr1, arr2)
  min1 = arr1[0]
  min2 = arr2[0]
  if min1 > min2 
    arr1[0], min2 = min2, arr1[0]
    arr2[1] = 

  end

  i = 0
  j = 0
  temp = 0
  while j < arr2.size
    if arr1[i] > arr2[j] 
      arr1[i], arr2[j] = arr2[j], arr1[i]
      if arr2[j+1] > arr1[i] 
      end
      i += 1
      j += 1
    end
  end
end