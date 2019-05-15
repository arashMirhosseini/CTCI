# Given n pairs of parentheses, write a function 
# to generate all combinations of well-formed parentheses.

# For example, given n = 3, a solution set is:

# [
#   "((()))",
#   "(()())",
#   "(())()",
#   "()(())",
#   "()()()"
# ]

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
end

def letter_combinations(digits)
  return [] if digits.length < 1
  maps = { '2' => 'abc', '3' => 'def', '4' => 'ghi',
            '5' => 'jkl', '6' => 'mno', '7' => 'pqrs',
            '8' => 'tuv', '9' => 'wxyz' }
  res = []
  backtrack(maps, '', digits, res)
  res
end

def backtrack(maps, combination, digits, arr)
  
  if digits.length == 0
    arr << combination
    return arr
  else
    
    maps[digits[0]].each_char do |c|
      # combination += c
      backtrack(maps, combination + c, digits[1..-1], arr)
    end
  end
 
end

def partition(arr, low, high)
  pivot = arr[high]
  i = low - 1
  j = low
  while j < high
    if arr[j] < pivot
      i += 1
      arr[i], arr[j] = arr[j], arr[i]
    end
    j += 1
  end
  arr[i+1], arr[high] = arr[high], arr[i+1]
  i + 1
end

def quick_sort(arr, low, high)
  if low < high 
    q = partition(arr, low, high)
    quick_sort(arr, low, q - 1)
    quick_sort(arr, q + 1, high)
  end
end

# p partition([2,8,7,1,3,5,6,4], 0, 7)
arr = [2,8,7,1,3,5,6,4]
quick_sort(arr, 0, 7)
p arr