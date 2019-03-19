#Given a list of numbers in an array, 
#replace all the numbers with the product of all 
#other numbers. Do this in O(n) time without using division.

def productify(arr)
  lower = [1]
  upper = [1]
  result = []

  arr[0..-2].each.with_index do |el, i|
    lower << lower[-1] * arr[i]
  end

  i = arr.length - 1
  while i > 0
    upper << upper[-1] * arr[i]
    i -= 1
  end

  i = 0
  j = arr.length - 1
  while i < arr.length
    result << lower[i] * upper[j]
    i += 1
    j -= 1
  end
  result
end

def prodcutify1(arr)
  result = Array.new(arr.length){1}
  lower = 1
  upper = 1

  1.upto(arr.length-1) do |i|
    lower = lower * arr[i-1]
    result[i] = lower * result[-1]
  end

  (arr.length-2).downto(0) do |i|
    upper = upper * arr[i + 1]
    result[i] = result[i] * upper
  end
  result
end

p prodcutify1([2,3,4,5])