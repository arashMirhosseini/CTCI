def is_unique(str)
  hash = Hash.new(0)
  str.each_char do |char|
    hash[char] += 1
    return false if hash[char] > 1
  end
  true
end

def is_unique2(str)
  array = Array.new(128){false}
  str.each_char do |char|
    return false if array[char.ord]
    array[char.ord] = true
  end
  true
end

def is_unique3(str)
  checker = 0
  str.each_char do |char|
    val = char.ord - 'a'.ord
    return false if checker & (1 << val) != 0
    checker |= 1 << val
  end
  checker.to_s(2)
end

def is_unique4(str)
  hash = Hash.new(0)
  str.each_char do |c|
    hash[c] += 1
    return false if hash[c] > 1
  end
  true
end

p is_unique4("helo")