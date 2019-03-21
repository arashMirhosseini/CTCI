#There are three types of edits that can be performed 
#on strings: insert a character, remove a character, 
#or replace a character. Given two strings, write a 
#function to check if they are one edit (or zero edits) 
#away.
#EXAMPLE
#pale, ple -> true 
#pales, pale -> true 
#pale, bale -> true 
#pale, bake -> false

def one_way(str1, str2)
  count = 0
  hash = Hash.new(0)
  str = str1 + str2
  str.each_char do |c|
    hash[c] += 1
    if hash[c] % 2 == 1
      count += 1
    else
      count -= 1
    end
  end
  return count <= 2
end

p one_way('ppale', 'pale')