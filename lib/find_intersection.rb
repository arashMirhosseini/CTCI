require_relative 'linked_list'
# Given two (singly) linked lists, determine if the two lists 
# intersect. Return the inter­ secting node. Note that the 
# intersection is defined based on reference, not value.
# That is, if the kth node of the first linked list is the exact 
# same node (by reference) as the jth node of the second linked list, 
# then they are intersecting.


# time complexity: O(n+m)
# space complexity: O(1)
def intersection(l1, l2)
  len1 = length(l1)
  len2 = length(l2)
  
  diff = (len1 - len2).abs

  if len1 > len2
    p1 = l1
    p2 = l2
    while p2
      
      p1 = p1.next
      diff -= 1
      p2 = p2.next if diff < 0 
      return p1 if p1 == p2
    end
  else
    p1 = l1
    p2 = l2
    while p1
      
      p2 = p2.next
      diff -= 1
      p1 = p1.next if diff < 0 
      return p1 if p1 == p2
    end
  end
end

def length(l)
  if l.nil?
    return 0
  else
    return 1 + length(l.next)
  end
end

l1 = NodeList.new(4)
# l1.append(10)


l2 = NodeList.new(5)
l2.append(10)
# l2.append(1)

l3 = NodeList.new(8)
l3.append(4)
l3.append(5)

l1.append_link(l3)
l2.append_link(l3)
# puts l3
puts l1
puts l2

puts intersection(l2, l1)