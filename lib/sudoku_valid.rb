

def is_valid_sudoku(board)
    validate_row?(board) && validate_culumn?(board) && validate_sub_box?(board)
end

def validate_sub_box?(board)
  k_r = [0, 3, 6]
  k_c = [0, 3, 6]
  k_r.each do |r|
    k_c.each do |c|
      # puts "#{r}, #{c}"
      return false unless validate_sub?(board, r, c)
    end
  end
  true
end

def validate_sub?(board, idx, idy)
  arr = []
  i = idx
  
  while i <= idx+2
    j = idy
    while j <= idy+2
      
      arr << board[i][j]
      # puts "arr: #{arr}"
      j += 1
    end
  
    i += 1
  end
  # puts "#{arr}"
  duplicate?(arr)
end

def validate_culumn?(board)
  board.transpose.each do |b|
    return false if !duplicate?(b)
  end
  true
end

def validate_row?(board)
  0.upto(8) do |i|
    return false if !duplicate?(board[i])
  end
  true
end

def duplicate?(arr)
  h = {
    '1' => 0, '2' => 0, '3' => 0, '4' => 0, '5' => 0,
    '6' => 0, '7' => 0, '8' => 0, '9' => 0
    }
  arr.each do |el|
    if h.include?(el)
      h[el] += 1 
      return false if h[el] > 1
    end
  end
  true
end

board =  [[".",".",".",".","5",".",".","1","."],
          [".","4",".","3",".",".",".",".","."],
          [".",".",".",".",".","3",".",".","1"],
          ["8",".",".",".",".",".",".","2","."],
          [".",".","2",".","7",".",".",".","."],
          [".","1","5",".",".",".",".",".","."],
          [".",".",".",".",".","2",".",".","."],
          [".","2",".","9",".",".",".",".","."],
          [".",".","4",".",".",".",".",".","."]]

p is_valid_sudoku(board)
