# Write an algorithm such that if an element in an 
# MxN matrix is 0, its entire row and column are set to 0.

def zero_matrix(matrix)
  n = matrix.size
  m = matrix[0].size
  r = nil
  c = nil
  0.upto(n-1) do |i|
    0.upto(m-1) do |j|
      if matrix[i][j] == 0
        r = i
        c = j
        break
      end
    end
  end  

  0.upto(n-1) do |i|
    matrix[i][c] = 0
  end

  0.upto(m-1) do |i|
    matrix[r][i] = 0
  end
  nil
end

matrix = [[1,2,0,4], [4,5,6,7], [8,9,1,2]]
zero_matrix(matrix)

p matrix
