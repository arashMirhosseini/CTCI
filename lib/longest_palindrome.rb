# Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

# Example 1:

# Input: "babad"
# Output: "bab"
# Note: "aba" is also a valid answer.

# @param {String} s
# @return {String}
def longest_palindrome(s)

  return s if s.length < 2
  n = s.size
  palindromic = Array.new(n){Array.new(n){false}}
  res = ''

  1.upto(n-1) do |i|
    0.upto(i-1) do |j|
      if s[i] == s[j] && ( j+1 >= i-1 || palindromic[j+1][i-1] )
        palindromic[j][i] = true
        res = s[j..i] if s[j..i].length > res.length
      end
    end
  end
  
  p res
end

longest_palindrome('abosobda')


