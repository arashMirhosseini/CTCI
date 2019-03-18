def palindrome_permut(str)
  count = 0
  hash = Hash.new(0)
  str = str.split(" ").join
  str.each_char do |c|
    hash[c] += 1
  end

  hash.each do |k,v|
    if str.length % 2 == 0
      return false if v != 2
    else
      if v == 1
        count += 1
        return false if count != 1
      end
      return false if v > 2
    end
  end

  true
end

p palindrome_permut("tqact coqa")