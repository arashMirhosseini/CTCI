# Given an array, move all zeros to the end. 
# The order of non-zero elements does not matter.
# Algorithm should be O(n); use O(1) extra space

# Example input/output
# > move_zeros([1, 2, 0, 3, 4, 0, 5, 6, 0]) 
# return [1, 2, 6, 3, 4, 5, 0, 0, 0]

def move_zeros(array)
  
  i = 0
  j = array.size-1
  while i < j
    
    if array[i] == 0 && array[j] != 0
      array[i], array[j] = array[j], array[i]
      i += 1
      j -= 1
    elsif array[i] == 0 && array[j] == 0
      j -= 1
    elsif array[i] != 0 && array[j] == 0
      i += 1
    else
      i += 1
      
    end
    
  end
  array
end

p move_zeros([1, 2, 0, 3, 4, 0, 5, 6, 0]) 