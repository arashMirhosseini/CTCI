# Delete Middle Node: Implement an algorithm to delete a node 
# in the middle (i.e., any node but the first and last node, 
# not necessarily the exact middle) of a singly linked list, 
# given only access to that node.
# Picture the list 1->5->9->12. Removing 9 would make it look 
# like 1->5->12. You only have access to the 9 node. 

require_relative 'linked_list'

def remove_middle(nodelist)
  nodelist.data = nodelist.next.data
  next_node = nodelist.next
  nodelist.next = next_node.next

end

linked = NodeList.new(3)
linked.append(1)
linked.append(5)
linked.append(9)
linked.append(12)

puts linked

remove_middle(linked.next.next)

puts linked
