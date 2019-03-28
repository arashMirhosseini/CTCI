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



l = NodeList.new('A')
l.append('B')

n1 = NodeList.new('C')
l.append_link(n1)

l2 = NodeList.new('D', 'E')
n1.next = l2
l2.last_node.next = n1

puts l
