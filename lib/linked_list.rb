
# doubly linked list
class LinkedList

  attr_accessor :head, :tail
  
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def append(data)
    node = Node.new(data)
    node.prev = tail.prev
    node.next = self.tail
    node.prev.next = node
    self.tail.prev = node
  end

  def remove(node)
    n1 = node.prev
    n2 = node.next
    n1.next = node.next
    n2.prev = node.prev
    node.next = nil
    node.prev = nil
  end

  def to_s
    res = ""
    n = self.head.next
    while n != tail

      res += (n.to_s + ' => ')
      n = n.next
    end
    res
  end
end

class Node
  
  attr_accessor :data, :next, :prev

  def initialize(data = nil)
    @data = data
    @next = nil
    @prev = nil
  end

  def to_s
    self.data.to_s
  end
end
# ----------------------------------------
# singly linked list
class NodeList
  
  attr_accessor :data, :next
  
  def initialize(data = nil, lk = nil)
    @data = data
    @next = lk

  end

  def append(data)
    
    node = self
    while !node.next.nil?
      node = node.next
    end
    node.next = NodeList.new(data)
  end

  def append_node(new_node)
    node = self

    while node.next
      node = node.next
    end

    node.next = new_node
    
  end

  def append_link(lk)
    self.last_node.next = lk
  end

  def last_node
    node = self
    while node.next
      node = node.next
    end
    node
  end

  def to_s
    node = self
    res = ''
    while !node.next.nil?
     
      res += node.data.to_s + ' => '
      node = node.next
    end
    res += node.data.to_s
    res
  end
end

#-------------- Helper methods for linked lists -----
# ------ Recursion in singly linked list--------


# Accessors :

def length_recursive(lk)
  if lk.nil?
    return 0
  else
    return 1 + length_recursive(lk.next)
  end
end

def sum_values(lk)
  if lk.nil
    return 0
  else
    return lk.data + sum_values(lk.next)
  end
end

def print_nodes(lk)
  if lk.nil? 
    puts
  else
    print "#{lk.data}" 
    print " => "
    print "#{print_nodes(lk.next)}"
  end
end

def reverse_print(lk)
  
  if lk.nil?
    return 
  else
    reverse_print(lk.next) 
    print ' => '
    print "#{lk.data}"
  end
end

def search(lk, val)
  if lk.nil? || lk.data == val
    return lk
  else
    search(lk.next, val)
  end
end

def copy(lk)
  if lk.nil?
    return nil
  else
    return NodeList.new(lk.data, copy(lk.next))
  end
end
# -------------------
# Mutators:

def insert_rear(lk, val)
  
end



def merge_two_lists(l1, l2)
  return nil if l1.nil? && l2.nil?
  return l1 if l2.nil?
  return l2 if l1.nil?
  res = nil
  if l1.data <= l2.data
    l1.next = l2
    l2.next = merge_two_lists(l1.next, l2.next)
    res = l1
  else
    l2.next = l1
    l1.next = merge_two_lists(l1.next, l2.next)
    res = l2
  end
  res
end

def merge_two_lists1(l1, l2)
  return l1 if l2.nil?
  return l2 if l1.nil?
  
  p1 = l1
  p2 = l2
  s = nil
  res = nil
  if p1.data <= p2.data
    s = p1
    p1 = p1.next
    res = l1
  else
    s = p2
    p2 = p2.next
    res = l2
  end
  
  while p1 && p2
    if p1.nil? || (p2.data <= p1.data)
      s.next = p2
      s = p2
      p2 = p2.next

    elsif p2.nil? || (p1.data < p2.data)
      s.next = p1
      s = p1
      p1 = p1.next
   
    end
  end
  if !p1.nil?
    s.next = p1
  elsif !p2.nil?
    s.next = p2
  end
  res
end

# time complexity: O(n)
# space complexity: O(1)
def is_palindrome(head)
  return true if head.nil? || head.next.nil?
  mid = length(head)/2
  node = head
  mid.times { node = node.next }
  sec_half = reverse(node)
  node = head
  (mid+1).times do 
    if node.nil? || sec_half.nil?
      return true 
    elsif node.data != sec_half.data
      return false 
    else
      node = node.next
      sec_half = sec_half.next
    end
  end
  
  true
end

# refactor if I want to improve space complexity 
def length(head)
  return 0 if head.nil?
  return 1 + length(head.next)
end

def reverse(head)
  return head if head.nil? || head.next.nil?
  
  p = reverse(head.next)
  
  head.next.next = head
  head.next = nil
  p
end

l1 = NodeList.new(1)
l1.append(2)
l1.append(2)
l1.append(1)
l2 = NodeList.new(1)
l2.append(3)
l2.append(4)

# puts l1
# puts length(l1)

# puts merge_two_lists(l1,l2)

# reverse_print(l1)
# puts 
# # p search(l1, 6)
# n = copy(l1)
# puts reverse(l1)
# node = l1
# puts node
# puts node.next

p is_palindrome(l1)


