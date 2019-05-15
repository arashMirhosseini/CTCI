# Word Count Engine
# Implement a document scanning function wordCountEngine, 
# which receives a string document and returns a list of all 
#unique words in it and their number of occurrences, 
#sorted by the number of occurrences in a descending order. 
#If two or more words have the same count, 
#they should be sorted according to their order in the 
#original sentence. Assume that all letters are in english 
#alphabet. You function should be case-insensitive, so for 
#instance, the words “Perfect” and “perfect” should be considered the same word.

# The engine should strip out punctuation 
#(even in the middle of a word) and use whitespaces to 
#separate words.

# Analyze the time and space complexities of your solution. 
#Try to optimize for time while keeping a polynomial space 
#complexity.

# Example: 
document = "Practice makes perfect. you'll only get Perfect by practice. just practice!"

# output: [ ["practice", "3"], ["perfect", "2"],
#           ["makes", "1"], ["youll", "1"], ["only", "1"], 
#           ["get", "1"], ["by", "1"], ["just", "1"] ]

def word_count_engine(document)
  words = document_to_array(document)
  p words
  
  counts = Hash.new(0)
  words.each { |word| counts[word] += 1 }
  res = counts.sort { |a, b| b.last <=> a.last }

  orders = Hash.new
  words.size.times do |i|
    if !orders.include? words[i]
      orders[words[i]] = i
    end
  end

  i = 0
  while i < res.size - 1
    j = i
    while j < res.size-1 && res[j][-1] == res[j+1][-1]
      j += 1
    end
    if i != j
      first = i
      last = j 
      temp = res[first..last].sort! { |a, b| orders[a.first] <=> orders[b.first] }
      res[first..last] = temp
      i += j + 1
    end
    i += 1
   
  end
  res.map! do |arr|
    s = arr.last.to_s
    arr = [arr[0], s]
  end
  res
end

def document_to_array(document)
  words = document.split(' ')
  words.map! do |word|
    word.downcase!
    word.split(/[^a-z]/).join
  end
  words
end

p word_count_engine(document)
# p document_to_array(document)

