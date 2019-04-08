class Bst
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
    return key if key == self.key
    
    if key < self.key && self.left
      self.left.lookup(key)
    elsif key < self.key && self.right
      self.right.lookup(key)
    end
    return nil
  end

  def delete(key)
    
  end
end

# ------------- BST problems ------------- From easy to hard --- 
def build123()
  root Bst.new(2)
  root.insert(1)
  root.insert(2)
end

# Given a binary tree, count the number of nodes in the tree.
def size(root)
  return 0 if root.nil?
  return size(root.left) + size(root.right) + 1
end

# Given a binary tree, compute its "maxDepth" -- 
# the number of nodes along the longest path from the root node down to the farthest leaf node.
def maxDepth(root)
  return 0 if root.nil?
  return [maxDepth(root.left), maxDepth(root.right)].max + 1
end


