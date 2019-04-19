def group_anagrams(strs)
  groups = []
  return res if strs.empty?
  for i in 0...strs.size do 
    next if strs[i].nil?
    str = strs[i]
    group = [str]
    strs[i] = nil
    for j in i+1...strs.size do 
      next if strs[j].nil?
      str1 = strs[j]
      if is_anagram?(str, str1)
        group << str1
        strs[j] = nil
      end
    end
    groups << group
    group = []
  end
  groups
end

def is_anagram?(str1, str2)
  return false if str1.length != str2.length
  hash = Hash.new(0)
  str1.each_char { |c| hash[c] += 1 }
  str2.each_char do |c|
    hash[c] -= 1
    return false if hash[c] < 0
  end
  true
end
strs = ['', '']
# strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
p group_anagrams(strs)