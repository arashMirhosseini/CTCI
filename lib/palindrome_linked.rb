require_relative 'linked_list'
# Implement a function to check if a linked list is a palindrome.

def palindrom?(lk)
  array = []
  node = lk
  while !node.nil?
    array << node.data
    node = node.next 
  end
  palindrom_array?(array)
end

def palindrom_array?(arr)
  
  i = 0
  j = arr.size-1

  while i <= j
    return false if arr[i] != arr[j]
    i += 1
    j -= 1
  end
  true
end

lk = NodeList.new('m')
lk.append('a')
lk.append('d')
lk.append('a')
lk.append('m')
lk.append('m')

p palindrom?(lk)