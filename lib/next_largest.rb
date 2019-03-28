# Given a node in a Binary Search Tree, find the node with the next largest value. 
# Meaning if you had the nodes in order by their value, find the node that would come 
# immediately after the node you were given. Assume you don't have the root of the tree, 
# just a single node from it.

# Hint: First solve with the assumption that the BST is fully balanced.
# When you're done, adjust your solution to account for an unbalanced BST. 
#Assume in the latter case that nodes have a pointer to their parent as well as 
#their left child and right child.

       5
    3     7
  2   4  6  8
 1 2.5    5.5     9

# if I'm the lest child, return my parent 
# if I'm the right child, look up my right sub tree
def next_largest(node)
  
  if node.parent && node.parent.left == node
    return parent 
  end

  n = node.right

  if n.nil?
    n = node.parent
    next_largest(n)
  else

    while n.left
    n = n.left
    end

  end
  
  return n
  
end

