require_relative 'linked_list'

# Given a circular linked list, implement an algorithm that returns the node 
# at the beginning of the loop.

# DEFINITION
# Circular linked list: A (corrupt) linked list in which a node's 
# next pointer points to an earlier node, so as to make a loop in 
# the linked list.

# Example:
# Input: A -> B -> C -> D -> E -> C[the same C as earlier]
# Output: C

def detect_loop?(l)
  return false if l.nil? || l.next.nil? || l.next.next.nil?
  
  p1 = l
  p2 = p1.next.next
  n = 0
  while p1 != p2
    if p2.nil?
      return false
    end
    p1 = p1.next
    return false if p2.next.nil?
    p2 = p2.next.next
    # p n
  end
  true
end

def detect_loop(l)
  
end

l = NodeList.new('A')
l.append('B')

n1 = NodeList.new('C')
l.append_link(n1)

l2 = NodeList.new('D')
l2.append('E')
n1.next = l2
l2.last_node.next = n1  

# puts l  
p detect_loop(l)