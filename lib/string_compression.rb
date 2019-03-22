# Implement a method to perform basic string 
#compression using the counts of repeated characters. 
#For example, the string aabcccccaaa would become 
#a2b1c5a3. If the "compressed" string would not become 
#smaller than the original string, your method should 
#return the original string. You can assume the string 
#has only uppercase and lowercase letters (a - z).

def string_compression(str)

  count = 1
  str_result = []
  i = 0
  while i <= str.size-2
    if str[i] == str[i+1] 
      count += 1
    else
      str_result << str[i]
      str_result << count.to_s
      count = 1
    end
    i += 1
  end
  str_result << str[i]
  str_result << count.to_s
  (str.size <= str_result.size) ? (return str) : (return str_result.join)
end

p string_compression('paabccccccaayyyyyy')
