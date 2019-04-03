def reverse(x)
  st = x.to_s
  res_s = st.reverse
  res = res_s.to_i
  if res_s[-1] == '-'
    res = res * (-1)
  end
  return 0 if res < -2147483648 || res > 2147483647
  return res
end

# p reverse(-123)

def is_palindrome(s)
  s = s.downcase
  s = s.split(/[^a-z0-9]*/).join

  # i = 0
  
  # st = []
  # while i < s.size
  #   if s[i] < 'a' || s[i] > 'z' 
  #     i += 1 
  #     next
  #   end
  #   st << s[i]
  #   i += 1
  # end
  # p st
  # return false if st.size == 1
  i = 0
  j = s.size-1
  while i < j
    
    return false if s[i] != s[j] 
    i += 1
    j -= 1
  end
  true
end

# p is_palindrome("09A90")
INT_MAX = 2**31-1
INT_MIN = -2**31

def my_atoi(str)
  res = 0
  flag = false
  i = 0
  while str[i] == ' '
    i += 1
    return 0 if i >= str.size
  end
  if str[i] == '-' 
    flag = true
    i += 1
  elsif str[i] == '+'
    i += 1
  end

  while i < str.size
    if str[i] >= '0' && str[i] <= '9'
      res = res*10 + str[i].ord - '0'.ord
    else
      break
    end
    i += 1
  end
  # res = res.to_i
  # flag = false
  res = -res if flag

  # if res[0] == '-' 
  #   res = res[1..-1]
  #   flag = true
  # elsif res[0] == '+'
  #   res = res[1..-1]
  # end
  # num = 0
  # res.each_char do |n|
  #   num = num*10 + n.ord - '0'.ord
  # end
  # num = -num if flag
  if res > INT_MAX
    return INT_MAX
  elsif res < INT_MIN
    return INT_MIN
  else
    return res
  end
  
end

p my_atoi('+1')