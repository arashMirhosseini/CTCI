#Rotate Matrix: Given an image represented by an 
#NxN matrix, where each pixel in the image is 4 bytes, 
#write a method to rotate the image by 90 degrees. 
#Can you do this in place?

def rotate_matrix(matrix)
  n = matrix.size

  0.upto(n/2) do |layer|
    first = layer 
    last = n - 1 - layer
    first.upto(last-1) do |i|
        offset = i - first
        temp = matrix[first][i]

        matrix[first][i] = matrix[last-offset][first]
        matrix[last-offset][first] = matrix[last][last-offset]
        matrix[last][last-offset] = matrix[i][last]
        matrix[i][last] = temp
            
        end
    end
  nil
end      

matrix = [[1,2,3],[4,5,6],[7,8,9]]
rotate_matrix(matrix)
p matrix