def digital_root(num)
  str = num.to_s
  array = str.chars
  sum = 0
  array.each do |el|
    num1 = el.to_i
    sum += num1
  end

  return sum if sum < 10

  digital_root(sum)
  
end

def fib(n)
 
  return 1 if n < 3
  
  fib = Array.new(2){1}

  i = 3
  while i <= n
    
    fib << fib[-1] + fib[-2]
    i += 1
  end
  
  fib[n-1]
end

# fib(n) = fib(n-1) + fib(n-2)
# fib = 1 if n < 3
# fib(3) = 1 + 1 = 2
# fib(4) = 2 + 1 = 3
# fib(5) = 3 + 2 = 5

def fib1(n)
  return 1 if n < 3
  # fib1(n-1) + fib1(n-2)
  fibs = [1, 1, 1]
  i = 3
  while i <= n
    fibs << fibs[i-1] + fibs[i-2]
    i += 1
  end
  fibs[n]
end

# Count ways to reach the n’th stair

def count_nth(n)
  # return n if n < 2
  # count_nth(n-1) + count_nth(n-2)
  fib1(n+1)
end

# p fib1(5)
p count_nth(4)

