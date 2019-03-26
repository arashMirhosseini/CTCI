require_relative 'linked_list'

# Write code to partition a linked list around a value x, 
# such that all nodes less than x come before all nodes 
# greater than or equal to x. If x is contained within the 
# list, the values of x only need to be after the elements 
# less than x (see below). The partition element x can appear 
# anywhere in the "right partition"; it does not need to 
# appear between the left and right partitions.

#EXAMPLE
# Input: 3 -> 5 -> 8 -> 5 -> 10 -> 2 -> 1[partition=5] 
# Output: 3 -> 1 -> 2 -> 10 -> 5 -> 5 -> 8

# naive approach
# O(n) time complexity 
# O(n) space complexity 
def partition(lk, x)
  node = lk
  less = []
  greater = []
  
  while !node.nil?
    if node.data < x
      less << node.data
    else
      greater << node.data
    end
    node = node.next
  end
  
  result = NodeList.new(less[0])
  less[1..-1].each do |n|
    result.append(n)
  end
  greater.each do |n|
    result.append(n)
  end
  
  result
end

lk = NodeList.new(3)
lk.append(5)
lk.append(8)
lk.append(5)
lk.append(10)
lk.append(2)
lk.append(1)

puts lk
puts partition(lk, 5)
