# Suppose a hash representing a directory. All keys are strings with names for either folders or files. 
# Keys that are folders point to nested hashes. Keys that are files point to "true". 
# Write a function that takes such a hash and returns an array of strings with the path to each file in the hash.


# file_list(files) # => ['a/b/c/d/e', 'a/b/c/f']

# hash = {
#   'file' => true,
#   'folder' => {}
# }

def file_list(hash)
  # return if hash.empty?
  res = []
  path = ''
  keys = hash.keys
  # keys.each do |key|
  #   path += key

  # end
  hash.each do |key, val|
   
    if val.keys.length == 1
      path += key
    
    elsif 
      
    else
      res << path
    end
  end
  res
end

hash = {
  'folder' => {},
  'file' => true
}

p file_list(hash)
