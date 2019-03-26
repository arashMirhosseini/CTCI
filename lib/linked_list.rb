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

# singly linked list
class NodeList
  
  attr_accessor :data, :next
  
  def initialize(data = nil)
    @data = data
    @next = nil
  end

  def append(data)
    
    node = self
    while node.next != nil
      node = node.next
    end
    node.next = NodeList.new(data)
  end

  def to_s
    node = self
    res = ''
    while node.next != nil
     
      res += node.data.to_s + ' => '
      node = node.next
    end
    res
  end
end