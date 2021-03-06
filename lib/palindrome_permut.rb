#Given a string, write a function to check if it 
#is a permutation of a palindrome. A palindrome 
#is a word or phrase that is the same forwards and 
#backwards. A permutation is a rearrangement of letters.
#The palindrome does not need to be limited to just 
#dictionary words.

def permutationOfPalindrome?(str)
  hsh = Hash.new(0)
  str = str.split(' ').join
  len = str.size
  count = 0
  str.each_char do |c|
    hsh[c.downcase] += 1
    if hsh[c.downcase] % 2 != 0
      count += 1
    else
      count -= 1
    end
  end
  return count <= 1
  # count = 0
  # hsh.each do |k, v|
  #     count += 1 if v % 2 != 0
  # end
  # return false if count > 1
  # true
end

p permutationOfPalindrome?("aaccTTTccaaPPP")