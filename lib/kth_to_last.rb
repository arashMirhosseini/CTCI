require_relative 'linked_list'

# Implement an algorithm to find the kth to last element of a 
# singly linked list.

# O(n) time complexity 
# O(1) space complexity 
def kth_to_the_last(linkedlist, k)
  length = 0
  node = linkedlist.head.next
  tail = linkedlist.tail
  while node != tail
    length += 1
    node = node.next
  end
  kth_ele_idx = length - 1 - k
  i = 0
  node = linkedlist.head
  while i <= kth_ele_idx
    node = node.next
    i += 1
  end
  node
end

linkedlist = LinkedList.new
linkedlist.append(3)
linkedlist.append(1)
linkedlist.append(2)
linkedlist.append(5)
linkedlist.append(1)
linkedlist.append(6)
linkedlist.append(3)
linkedlist.append(3)

puts linkedlist.to_s

n = kth_to_the_last(linkedlist, 4)
puts n

