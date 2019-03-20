# Write a function that takes a string 
# and returns true if it's a palindrome, 
# false if it's not.

# > is_palindrome("abba") // = true

# > is_palindrome("bye") // = false

# > is_palindrome("a") // = true

# > is_palindrome("") // = true

def is_palindrome(str)
  l = 0
  r = str.size - 1
  while l < r
    return false if str[l] != str[r]
    l += 1
    r -= 1
  end
  true
end

p is_palindrome('')