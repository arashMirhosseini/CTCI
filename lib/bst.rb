class Node
  attr_accessor :key, :left, :right
  
  def initialize(key)
    @key = key
    @left, @right = nil
  end

  def insert(key)
    if key <= self.key
      if self.left
        self.left.insert(key)
      else
        self.left = Node.new(key)
      end
    else
      if self.right
        self.right.insert(key)
      else
        self.right = Node.new(key)
      end
    end
  end

  def lookup(key)
    
  end

end