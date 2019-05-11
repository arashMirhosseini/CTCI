def letter_combinations(digits)
  return [] if digits.length < 1
  maps = { '2' => 'abc', '3' => 'def', '4' => 'ghi',
            '5' => 'jkl', '6' => 'mno', '7' => 'pqrs',
            '8' => 'tuv', '9' => 'wxyz'}
  res = []
  backtrack(maps, '', digits, res)
  res
end

def backtrack(maps, combination, digits, arr)
  
  if digits.length == 0
    arr << combination
    return arr
  else
    
    maps[digits[0]].each_char do |c|
      # combination += c
      backtrack(maps, combination + c, digits[1..-1], arr)
    end
  end
 
end

