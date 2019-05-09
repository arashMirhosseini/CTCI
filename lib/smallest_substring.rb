# Smallest Substring of All Characters
# Given an array of unique characters arr and a string str, 
# Implement a function get_shortest_unique_substring that finds the 
# smallest substring of str containing all the characters in arr. 
# Return "" (empty string) if such a substring doesn’t exist.

# input:  
arr = ["A","B","C"]
str =  "ADOBECODEBANCDDD"

# output: "zyx"
require 'set'
def get_shortest_unique_substring(arr, str)
  # set = Set.new
  # arr.each { |c| set.add(c) }
  m = arr.size
  res = ''
  i, j = [0, m - 1]
  
  while j < str.size
    substring = str[i..j]
    # p substring
    if contains?(arr, substring)
      # p 'y'
      return substring if j - i + 1 == m
      if substring.length < res.length || res.empty?
        res = substring 
      end
      while j - i + 1 > m 
        i += 1
        if contains?(arr, str[i..j])
          res = str[i..j] if str[i..j].length < res.length || res.empty?
        end
        
      end

    end
    j += 1
  end
  res
end

def contains?(arr, substring)
  set = Set.new
  substring.each_char { |c| set.add(c) }
  arr.each do |c|
    if !set.include?(c)
      return false
    end
  end
  true
end


p get_shortest_unique_substring(arr, str)
# use two pointers: i = 0, j = arr.size-1
# advance j until substring contains all chars from arr
# then start to advance i while j - i + 1 > arr.size 
#    && substring contain all chars
#     return j - i + 2



 