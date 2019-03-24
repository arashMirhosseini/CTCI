# Assume you have a method isSubstring which checks if one 
# word is a substring of another. 
# Given two strings, s1 and s2, write code to check if s2 is 
# a rotation of s1 using only one call to isSubstring 
# (e.g., "waterbottle" is a rotation of" erbottlewat").

# in Ruby, we can use include? method as isString method

# both solutions have time complexity: O(n)

def string_rotation?(s1, s2)
  return false unless s1.size == s2.size

  i = 0
  j = 0
  while j < s2.size
    if s1[i] == s2[j]
      i += 1
      j += 1
    else
      j += 1
    end
  end
  index = j - i
  return false unless s1.include? s2[0...index]
  true
end

def string_rotation1?(s1, s2)
  return false unless s1.size == s2.size

  s = s1 + s1
  s.include? s2
end

p string_rotation1?('waterbottle', 'ottlewaterb')
