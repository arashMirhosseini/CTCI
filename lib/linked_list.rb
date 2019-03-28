
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

# l1 = NodeList.new(7)
# l1.append(1)
# l1.append(6)
# l1.append(9)

# reverse_print(l1)
# puts
# # p search(l1, 6)
# n = copy(l1)


