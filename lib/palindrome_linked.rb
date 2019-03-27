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

# iterative approach
def reverse_lk(lk)
  prv = nil
  curr = lk
  nxt = nil
  while curr
    nxt = curr.next
    curr.next = prv
    prv = curr
    curr = nxt
  end
  lk = prv
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
lk.append('t')
lk.append('d')
lk.append('a')
lk.append('s')
# lk.append('m')

# p palindrom?(lk)

l = reverse_lk(lk)
puts l

