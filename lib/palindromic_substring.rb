# Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

# Input: "babad"
# Output: "bab"
# Note: "aba" is also a valid answer.

def is_palindrome1?(str)
  return true if str.length < 2
  str[0] == str[-1] && is_palindrome?(str[1..-2])
end

def palindromic_substring(str)
  return str if str.length < 2
  n = str.length
  palindromic = Array.new(n){Array.new(n){false}}
  left, right = [0, 0]
  
  for j in 1..n-1 do 
    for i in 0..j-1 do 
      if str[i] == str[j] && (j-i <= 2 || palindromic[i+1][j-1])
        palindromic[i][j] = true
        left, right = [i, j] if j - i > right - left
      end
    end
  end
  
  str[left..right]
end

# p is_palindrome?('madanm')
p palindromic_substring('madammm')

def increasing_triplet(nums)
  a = b = Float::INFINITY
  nums.each do |n|
    a = [a, n].min
    b = [b, n].min if n > a
    return true if n > b
  end
  false
end

# [2, -3, 2, 4, 5]
n = 5
a = 2
b = 4
