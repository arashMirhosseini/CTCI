# You are given two non-empty linked lists representing two 
# non-negative integers. The digits are stored in reverse 
# order and each of their nodes contain a single digit. 
# Add the two numbers and return it as a linked list.

# You may assume the two numbers do not contain any leading zero, 
# except the number 0 itself.

# Example:

# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
class ListNode
  attr_accessor :val, :next
  def initialize(val = nil)
    @val = val
    @next = nil
  end
end

def add_two_numbers(l1, l2)
  res_l = ListNode.new
  node = res_l
  curry = 0
  while l1 || l2
    if l1.nil? 
      n = l2.val + curry 
    elsif l2.nil?
      n = l1.val + curry
    else
      n = l1.val + l2.val + curry
    end
    node.next = ListNode.new(n % 10)
    node = node.next
    curry = n / 10
    l1 = l1.next if l1
    l2 = l2.next if l2
  end
  node.next = ListNode.new(curry) if curry != 0
  
  res_l.next
end