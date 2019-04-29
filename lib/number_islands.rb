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

grid = [["1","1","1","1","0"],
        ["1","1","0","1","0"],
        ["1","1","0","0","0"],
        ["0","0","0","0","0"]
]

# grid = [['1','1','0','0','0'],
#         ['1','1','0','0','0'],
#         ['0','0','1','0','0'],
#         ['0','0','0','1','1']
# ]
# grid  = [["1","1","1"],
#          ["0","1","0"],
#          ["1","1","1"]
# ]

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  n, m = [grid.size, grid[0].size]
  
  visited = Array.new(n){Array.new(m){false}}
  count = 0

  for i in 0...n do 
    for j in 0...m do 
      if is_valid?(i, j, grid, visited)
        visited[i][j] = true
        count += 1
        visited = dfs(i, j, grid, visited)
      end
    end
  end
  count
end

def dfs(i, j, grid, visited)
  n, m = [grid.size, grid[0].size]
  r_offsets = [-1, 0, 0, 1]
  c_offsets = [0, -1, 1, 0]
  for k in 0...4 do 
    r = i + r_offsets[k]
    c = j + c_offsets[k]
    if is_valid?(r, c, grid, visited)
      visited[r][c] = true
      dfs(r, c, grid, visited)
    end
  end
  visited
end

def is_valid?(i, j, grid, visited)
  n, m = [grid.size, grid[0].size]
  i >= 0 && i < n && j >= 0 && j < m && grid[i][j] == '1' && !visited[i][j]
end

# hash = {}
# hash[[0,0]] = true
# hash[[0,1]] = true
# hash[[1,0]] = true
p num_islands(grid)