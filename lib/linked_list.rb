class LinkedList
  
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
end

class Node
  
  attr_accessor :data, :next

  def initilize(data = nil)
    @data = data
    @next = nil
    @prev = nil
  end
end