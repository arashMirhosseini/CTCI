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

p fib(5)
