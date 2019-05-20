# Matrix Spiral Copy
# Given a 2D array (matrix) inputMatrix of integers, create a 
# function spiralCopy that copies inputMatrix’s values into a 1D 
# array in a spiral order, clockwise. Your function then should 
# return that array. Analyze the time and space complexities of
#  your solution.

# input:  inputMatrix  = [ [1,    2,   3,  4,    5],
#                          [6,    7,   8,  9,   10],
#                          [11,  12,  13,  14,  15],
#                          [16,  17,  18,  19,  20] ]

# output: [1, 2, 3, 4, 5, 10, 15, 20, 19, 18, 17, 16, 11, 6, 7, 8, 9, 14, 13, 12]

def spiral_copy(matrix)
  n = matrix.size
  m = matrix[0].size
  res = []
  i, j = [0, 0]

  while i < n && j < m
    p "n: #{n}, m: #{m}"
    p "i: #{i}, j: #{j}"
    res += matrix[i][j..m-1]
    p res
    if (n-1 != i) 
      (i+1).upto(n-1) do |k|
        res << matrix[k][m-1]
      end
      p res
      res += matrix[n-1][j..m-2].reverse if j != m-1
      p res
      temp = []
      if j != m-1
        (i+1).upto(n-2) do |k|
          temp << matrix[k][j]
          
        end
        res += temp.reverse
      end
      p res
    end
    
    i += 1
    j += 1
    n -= 1
    m -= 1
  end
  res

end


matrix  = [ [1,    2,   3,  4,    5],
                         [6,    7,   8,  9,   10],
                         [11,  12,  13,  14,  15],
[16,  17,  18,  19,  20] ]

m =[
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9,10,11,12]
]

m1 = [[1,2,3],[4,5,6],[7,8,9]]
m2 = [[3],[2]]
spiral_copy(matrix)
