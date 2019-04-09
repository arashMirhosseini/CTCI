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

# Given a binary tree, print out all of its root-to-leaf paths
def printPaths(root)
  paths = []
  printPathsRecur(root, paths)
end

# helper method
# Recursive printPaths helper -- given a node, and an array containing 
#  the path from the root node up to but not including this node, 
#  prints out all the root-leaf paths. 
def printPathsRecur(node, paths)
  return if node.nil?

  paths << node.key

  if node.left.nil? && node.right.nil?
    printArray(paths)
  end

  printPathsRecur(node.left, paths)
  printPathsRecur(node.right, paths)
end

# helper method to print from an array
def printArray(values)
  values.each {|val| print "#{val}, "}
  puts
end

# Change a tree so that the roles of the left and right 
# pointers are swapped at every node.
def mirror(root)
  # return root if root.nil?

  # root.left, root.right = root.right, root.left
  # mirror(root.left)
  # mirror(root.right)
  if root
    mirror(root.left)
    mirror(root.right)
    root.left, root.right = root.right, root.left
  end
end

# For each node in a binary search tree, create a new duplicate node,
# and insert the duplicate as the left child of the original node. 
# The resulting tree should still be a binary search tree.

def doubleTree(root)
  return root if root.nil?
  
  doubleTree(root.left)
  doubleTree(root.right)
  visit(root)

end

def inorder(root)
  return if root.nil?

  inorder(root.left)
  visit(root)
  inorder(root.right)

end

def visit(node)
  new_node = Bst.new(node.key)
  new_node.left = node.left
  # new_node.right = node.right
  node.left = new_node
end

# Given two binary trees, return true if they are
# structurally identical -- they are made of nodes with 
# the same values arranged in the same way
def sameTree?(root1, root2)
  return false if root1.nil? || root2.nil?
  
  return false if root1.key != root2.key
  return sameTree?(root1.left, root2.left) && sameTree?(root2.right, root2.right)

end

