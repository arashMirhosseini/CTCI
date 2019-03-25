require_relative 'linked_list'
require 'set'

# Write code to remove duplicates from an unsorted 
# linked list.

# using a hash set 
# O(n) time & space complexity 
def remove_dups(linkedlist)
	hash_set = Set.new
	node = linkedlist.head.next
	tail = linkedlist.tail
	while node != tail
		hash_set.add(node.data)
		node = node.next
	end
	result = LinkedList.new
	hash_set.each do |data|
		result.append(data)
	end
	result
end

# O(n^2) time complexity 
# O(1) space complexity 
def remove_dups1(linkedlist)
	tail = linkedlist.tail
	p1 = linkedlist.head.next
	p2 = p1.next

	while p1 != tail
		
		while p2 != tail
			if p2.data == p1.data
				p2_prev = p2.prev
				linkedlist.remove(p2)
				p2 = p2_prev.next
			else
				p2 = p2.next
			end
			
		end
		p1 = p1.next
		p2 = p1.next
	end
	linkedlist
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

res = remove_dups(linkedlist)
puts res.to_s


