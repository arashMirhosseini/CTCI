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

def is_palindrom?(l)
  l_rev = reverse_lk(l)
  
  node1 = l
  node2 = l_rev
  while node1
    return false if node1.data != node2.data

    node1 = node1.next
    node2 = node2.next
  end
  true

end

# iterative approach
# O(n) time
# O(1) space
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

# recursive approach 
def reverse_lk_recur(lk)
 
  if lk.next.nil?
    return nil
  else
    reverse_lk_recur(lk.next)
    lk.next.next = lk
    lk.next = nil
    
  end

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
# lk.append('m')

# p palindrom?(lk)

# l = reverse_lk_recur(lk)
# puts l

p is_palindrom?(lk)
