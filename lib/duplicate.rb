# remove duplicates from an array

require 'set'
def remove_duplicates(array)
  arr = Set.new

  array.each {|el| arr.add(el)}
  res = []
  arr.each {|el| res << el}

  res

end

p remove_duplicates([1,2,3,4,4,5,5])