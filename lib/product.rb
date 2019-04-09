# Given an array of integers, find the greatest product of three of the integers.

# Examples: 
# [1, 2, 3] => 1 * 2 * 3 = 6
# [0, 1, 0, 4, -2] => 0 * 0 * 4 = 0
# [-4, 7, -6, 5, 1] => -4 * -6 * 7 = 168 

# input: array of int
# output: int 

# [0, 1, 0, 4, -2]
# [1, 0, 4, -2] * 0 = res

#   0
#  [ 1, 0, 4, -2] -> 1
#    [0, 4, -2]

#    0*1*0
#    0*1*4
#    0*1*-2

# arr1 = []
# for i: 0 .. len
#   for j: i+1 .. len
#     for k: j+1 .. len
#       pr = arr[i]*arr[j]*arr[k]

# return arr1.max
#       O(n^3)



# O(n^3)
def greatest_product(arr)
  # return 1 if arr.empty?
  # res = greatest_product(arr[1..-1])
  # result = arr[0] * res
  # result > res ? (return result) : (return res)
  res = []
  for i in 0..arr.size-1 do 
    for j in i+1..arr.size-1 do 
      for k in j+1..arr.size-1 do 
        res << arr[i]*arr[j]*arr[k]
      end
    end
  end
  res.max
end

def greatest_product1(arr)
  # arr1 = []
  # arr.each do |el| 
  #   el = el.abs
  #   arr1 << el
  # end
  # p arr1
  # arr1.sort!
  # p arr1
  # arr1[-1]*arr1[-2]*arr1[-3]
  arr.sort!
  
end



# arr = [0, 1, 0, 4, -2] 


arr = [-4, 7, -6, 5, 1]


# arr = [1,2,3]
#  => -4 * -6 * 7 = 168 
p greatest_product1(arr)