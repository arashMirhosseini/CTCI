def permutation?(str1, str2)
  return false if str1.length != str2.length
  str1.downcase.chars.sort == str2.downcase.chars.sort  
end

def permutation1?(str1, str2)
  return false if str1.length != str2.length

  hash1 = Hash.new(0)

  str1.each_char do |c|
    hash1[c] += 1
  end
  str2.each_char do |c|
    hash1[c] -= 1
    return false if hash1[c] < 0
  end
  true 
end

def permutation2(str1, str2)
  return false if str1.length != str2.length

  array = Array.new(128){0}
  str1.each_char { |c| array[c.ord] += 1 }
  str2.each_char do |c| 
    array[c.ord] -= 1 
    return false if array[c.ord] < 0
  end
  true
end
p permutation2('lheplo', 'oellph')