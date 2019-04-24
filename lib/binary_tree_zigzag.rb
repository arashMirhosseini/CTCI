# Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to 
# left for the next level and alternate between).

# For example:
# Given binary tree [3,9,20,null,null,15,7],
#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its zigzag level order traversal as:
# [
#   [3],
#   [20,9],
#   [15,7]
# ]

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Integer[][]}
def zigzag_level_order(root)
  list = [[]]
  level_order(root, list)
  list
end

def level_order(root, list)
  que = [root, nil]
  level = 1
  while !que.empty?
    n = que.shift
    if n
      list[-1] << n.val
    else
      break if que.empty?
      list << []
      que.push(nil)
      level += 1
      next
    end
    if level.even?
      que << n.left if n.left
      que << n.right if n.right
    else
      que << n.right if n.right
      que << n.left if n.left
    end
    # level += 1
  end
end
# input:
#       1
#     /   \
#    2     3
#   /       \
#  4         5
# output: [[1], [3, 2], [4, 5]]

tree = TreeNode.new(3)
tree.left = TreeNode.new(9)
tree.right = TreeNode.new(20)
tree.right.left = TreeNode.new(15)
tree.right.right = TreeNode.new(7)
# tree.right.right.right = TreeNode.new(13)

p zigzag_level_order(tree)

