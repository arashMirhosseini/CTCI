# Given a 2d grid map of '1's (land) and '0's (water), 
# count the number of islands. An island is surrounded by water 
# and is formed by connecting adjacent lands horizontally or 
# vertically. You may assume all four edges of the grid are all 
# surrounded by water.

# Example 1:

# Input:
# 11110
# 11010
# 11000
# 00000

# Output: 1

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
end

def any_neighbor_visited?(i, j, hash, grid)
  n = grid[0].size
  m = grid.size
  r_offsets = [-1, 0, 0, 1]
  c_offsets = [0, -1, 1, 0]
  for k in 0..3 do 
    if valid?(i + r_offsets[k], j + c_offsets[k], n, m)
      neighbor = grid[i + r_offsets[k]][j + c_offsets[k]]
      return true if neighbor == 1 && hash.include?([[i + r_offsets[k],j + c_offsets[k]]])
    end
  end
  false
end

def valid?(i, j, n, m)
  i >= 0 && i <= n-1 && j >= 0 && j <= m - 1
end