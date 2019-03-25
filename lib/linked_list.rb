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