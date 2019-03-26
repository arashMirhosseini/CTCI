# 10 = 1010

# 10 / 2 == 0
# 10 % 

def convert_bin(num)
  
  return 0 if num == 0
  res = []
  n = num
  while (n > 0)
    res.unshift(n % 2)
    n = n / 2
  end
  res.join('')
  
end

p convert_bin(0)