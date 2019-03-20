# Write a method that reads in a file of integers, 
# one per line, and sums them. Skip the line 
# if it begins with a "#".

# Example input/output
# > sum_from_file("a.txt") // = 15

# > sum_from_file("b.txt") // = 1

# > sum_from_file("c.txt") // = 0

# a.txt
# 4
# 6
# 3
# 2
#----
# b.txt
# #1
# 1
#-------
# c.txt
# # no lines

def sum_from_file(filename)
  str = Fila.read(filename)

end
