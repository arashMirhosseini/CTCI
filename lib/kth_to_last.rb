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

def kth_to_the_last1(linkedlist, k)
  if k == 0
    node = linkedlist.head.next
    tail = linkedlist.tail
    while node.next != tail
      node = node.next
    end
    return node
  end

  node_next = kth_to_the_last1(linkedlist, k-1)
  node = linkedlist.head.next
  tail = linkedlist.tail
  while node.next != node_next
    node = node.next
  end
  return node
end

# this method takes the head node of linkedlist
# O(n) time
# O(1) space
def kth_to_the_last2(head_node, k)
  
  p1 = head_node
  p2 = p1
  i = 0 
  while i < k && p2.next != nil
    p2 = p2.next
    i += 1
  end

  while p2.next != nil
    p1 = p1.next
    p2 = p2.next
  end

  p1.data
end

# linkedlist = LinkedList.new
# linkedlist.append(8)
# linkedlist.append(1)
# linkedlist.append(2)
# linkedlist.append(5)
# linkedlist.append(1)
# linkedlist.append(6)
# linkedlist.append(3)
# linkedlist.append(3)

# puts linkedlist.to_s

# n = kth_to_the_last1(linkedlist, 4)
# puts n

linked = NodeList.new
linked.append(8)
linked.append(1)
linked.append(2)
linked.append(5)
linked.append(1)
linked.append(6)

puts linked

n = kth_to_the_last2(linked, 1)
puts n

