# K-Messed Array Sort
# Given an array of integers arr where each element is at most k 
# places away from its sorted position, code an efficient function 
# sortKMessedArray that sorts arr. For instance, for an input 
# array of size 10 and k = 2, an element belonging to index 6 in 
# the sorted array will be located at either index 4, 5, 6, 7 or 8 
# in the input array.

# Analyze the time and space complexities of your solution.

# input:  
arr = [1, 4, 5, 2, 3, 7, 8, 6, 10, 9] 
k = 2

# output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

def sort_k_messed_array(arr, k)
  insersion_sort(arr)
end

def build_heap(arr)
  n = arr.size
  ((n-1)/2).downto(0) do |i|
    min_heapify(arr, n, i)
  end
end

def min_heapify(arr, size, idx)
  smallest = idx
  left = idx * 2 + 2
  right = left + 1
  
  if left < size && arr[left] < arr[smallest]
    smallest = left
  end
  
  if right < size && arr[right] < arr[smallest]
    smallest = right
  end
  
  if smallest != idx
    arr[smallest], arr[idx] = arr[idx], arr[smallest]
    heapify(arr, size, smallest)
  end
  
end

def insersion_sort(arr)
  i = 1
  while i < arr.size
    j = i
    while j > 0 && arr[j] < arr[j-1]
      puts "i: #{i}, j: #{j}"
      puts "arr: #{arr}"
      arr[j], arr[j-1] = arr[j-1], arr[j]
      puts "arr (after): #{arr}"
      j -= 1
    end
    i += 1
   
  end
  arr
end
# p sort_k_messed_array(arr, k)
# insersion_sort(arr)
# p arr
nums = [2, 0, 1]
# nums = [2,0,2,1,1,0]
# p insersion_sort(nums)

