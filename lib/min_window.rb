# Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).

# Example:

# Input: S = "ADOBECODEBANC", T = "ABC"
# Output: "BANC"

def min_window(s, t)
  left, right = [0, 0]
  counter = t.size
  res = []
  hash = Hash.new(0)
  t.each_char { |c| hash[c] += 1 }

  while right < s.size
    if hash.include? s[right] && hash[s[right]] > 0
      hash[s[right]] -= 1
      counter -= 1
      right += 1
    end

    while counter == 0
      res << s[left..right]
      if hash.include? s[left]
        hash[s[left]] += 1
        counter += 1 if hash[s[left]] > 0
      end
      left += 1
    end
    
  end
end