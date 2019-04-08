# Binary Search Tree class
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
        self.left = Bst.new(key)
      end
    else
      if self.right
        self.right.insert(key)
      else
        self.right = Bst.new(key)
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

# Given a non-empty binary search tree (an ordered binary tree), 
# return the minimum data value found in that tree
def minValue(root)
  return root.key if root.left.nil?
  return minValue(root.left)
end

def minValue1(root)
  node = root
  while node.left
    node = node.left
  end
  node.key
end

# Given a binary search tree (aka an "ordered binary tree"), 
# iterate over the nodes to print them out in increasing order.
def printTree(root)
  return if root.nil?
  
  printTree(root.left) 
  print "#{root.key} "
  printTree(root.right) 
end

# Given a binary tree, print out the nodes of the tree according to a bottom-up "postorder" traversal
def printPostorder(root)
  return if root.nil?
  printPostorder(root.left)
  printPostorder(root.right)
  print "#{root.key} "
end

# Given a binary tree and a sum, return true if the tree has a root-to-leaf
# path such that adding up all the values along the path equals the given sum. 
# Return false if no such path can be found. 
def hasPathSum?(root, sum)
  if root.nil?
    return sum == 0 
  else
    subsum = sum - root.key
    return hasPathSum?(root.left, subsum) || hasPathSum?(root.right, subsum)
  end

end




