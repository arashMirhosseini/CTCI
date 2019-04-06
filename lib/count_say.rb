# The count-and-say sequence is the sequence of integers with the 
# first five terms as following:

# 1.     1
# 2.     11
# 3.     21
# 4.     1211
# 5.     111221

# 1 is read off as "one 1" or 11.
# 11 is read off as "two 1s" or 21.
# 21 is read off as "one 2, then one 1" or 1211.

# Given an integer n where 1 ≤ n ≤ 30, generate the nth term 
# of the count-and-say sequence.

# @param {Integer} n
# @return {String}
def count_and_say(n)
  return '1' if n==1
  return nil if n < 1 || n > 30
  init = count_and_say_num(1).to_i
  (n-2).times do 
    init = count_and_say_num(init).to_i
  end
  init.to_s
end

def count_and_say_num(n)
  prev = n%10
  num = n/10
  # res = [prev]
  res = prev
  counter = 1
  count = 10
  c = 1
  while num != 0
    dig = num%10
    if dig != prev
      count = count**(c)
      res += counter*(count)
      res += dig*(count)
      # res.unshift(counter)
      # res.unshift(dig)
      prev = dig
      counter = 1
      
    else
      counter += 1
    end
    num = num/10
    c += 1
   
  end
  # res.unshift(counter)
  res += counter*count
  # res.join
  res
end

def count_say(n)
  return '1' if n==1
  s = '1'
  for i in 1..n-1
    s.gsub!(/(.)\1*/) { |m| "#{m.size}#{m[0]}" }
  end
  s
end

# p count_and_say_num(1211)
# p count_say(6)

def longest_common_prefix(strs)
  n = strs.size
  return "" if n < 1
  prefix = strs[0]

  for i in 1..n-1 do
    while strs[i].index(prefix) != 0
     
      prefix = prefix[0...prefix.size-1]
      return "" if prefix.empty?
    end
  end
  prefix
end

p longest_common_prefix(["flower","flow","flight"])