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

# Example 2:
# Input:
# 11000
# 11000
# 00100
# 00011
# Output: 3

# grid = [["1","1","1","1","0"],
#         ["1","1","0","1","0"],
#         ["1","1","0","0","0"],
#         ["0","0","0","0","0"]
# ]

# grid = [['1','1','0','0','0'],
#         ['1','1','0','0','0'],
#         ['0','0','1','0','0'],
#         ['0','0','0','1','1']
# ]
grid  = [["1","1","1"],
         ["0","1","0"],
         ["1","1","1"]
]

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  n, m = [grid.size, grid[0].size]
  count = 0
  hash = {}
  for i in 0...n do 
    for j in 0...m do 
      if grid[i][j] == '1'
        hash[[i, j]] = true
        if !any_neighbor_visited?(i, j, hash, grid)
          # p hash
          # p [i,j]
          count += 1 
        else
          # p 'yes'
        end
      end
    end
  end
  count
end

def any_neighbor_visited?(i, j, hash, grid)
  n, m = [grid.size, grid[0].size]
  r_offsets = [-1, 0, 0, 1]
  c_offsets = [0, -1, 1, 0]
  for k in 0..3 do 
    r = r_offsets[k]
    c = c_offsets[k]
    if valid?(i + r, j + c, n, m)
      neighbor = grid[i + r][j + c]
      if neighbor == '1' && hash.include?([i + r, j + c])
        # p [i + r_offsets[k], j + c_offsets[k]]
        return true
      end
    end
  end
  false
end

def valid?(i, j, n, m)
  i >= 0 && i <= n-1 && j >= 0 && j <= m - 1
end

# hash = {}
# hash[[0,0]] = true
# hash[[0,1]] = true
# hash[[1,0]] = true
p num_islands(grid)