require_relative 'linked_list'

# You are given two non-empty linked lists representing two non-negative integers. 
# The digits are stored in reverse order and each of their nodes contain a single digit. 
# Add the two numbers and return it as a linked list.

# You may assume the two numbers do not contain any leading zero, 
# except the number 0 itself.

# Example:
# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.

# naive approach 
# O(n^2) time complexity 
# O(n+m) space complexity 
def add_two_numbers(l1, l2)
  num1 = []    
  num2 = []
  node1 = l1
  while !node1.nil?
    num1.unshift(node1.data)
    node1 = node1.next
  end
  node2 = l2
  while !node2.nil?
    num2.unshift(node2.data)
    node2 = node2.next
  end
  sum_two_arrays(num1, num2)
end
#########----------------------------------------

# O(n) time complexity 
# O(n) space complexity 
def add_two_numbers1(l1, l2)
  
  nums1 = []
  nums2 = []
  node1 = l1
  node2 = l2

  while !node1.nil?
    nums1 << node1.data
    node1 = node1.next  
  end

  while !node2.nil?
    nums2 << node2.data
    node2 = node2.next  
  end

  res = sum_two_arrays_reverse(nums1, nums2)
  link = NodeList.new(res[0])
  res[1..-1].each do |num|
    link.append(num)
  end
  link
end

# --------------
# improve space complexity 
#
def add_two_numbers2(l1, l2)
  node1 = l1
  node2 = l2
  carry = 0
  sum = l1.data + l2.data
  carry = 1 if sum > 9
  res = NodeList.new(sum%10)
  
  node1_val = 0
  node2_val = 0
  
  node1 = node1.next
  node2 = node2.next
  while !node1.nil? || !node2.nil?
    if node1.nil? 
      node1_val = 0 
    else
      node1_val = node1.data
    end
    if node2.nil? 
      node2_val = 0 
    else
      node2_val = node2.data
    end
    
    sum = node1_val + node2_val + carry 
    if sum > 9
      carry = 1
    else 
      carry = 0
    end
    res.append(sum % 10)
    node1 = node1.next
    node2 = node2.next
  end
  res.append(carry) if carry != 0
  res
end


# O(n) time
def sum_two_arrays_reverse(arr1, arr2)
  sum = 0
  carry = 0
  result = []
  len = 0
  arr1.size >= arr2.size ? (len = arr1.size) : (len = arr2.size)
  len.times do |i|
    arr1[i] = 0 if arr1[i].nil?
    arr2[i] = 0 if arr2[i].nil?
    sum = arr1[i] + arr2[i] + carry
    if sum > 9
      carry = 1
    else
      carry = 0
    end
    result << sum % 10
  end
  result << carry if carry != 0
  result
end


def sum_two_arrays(arr1, arr2)
  num1 = arr1.join('').to_i
  num2 = arr2.join('').to_i
  num1 + num2
end

#------------------------------------------------
# Suppose the digits are stored in forward order. Repeat the above problem. 
# EXAMPLE
# Input:(6 -> 1 -> 7) + (2 -> 9 -> 5).That is,617 + 295. 
# Output:9 -> 1 -> 2. 
# That is 912.

def add_two_numbers_forward(l1, l2)
  
end


l1 = NodeList.new(7)
l1.append(1)
l1.append(6)

l2 = NodeList.new(5)
l2.append(9)
l2.append(2)

puts l1
puts l2

# p add_two_numbers(l1, l2)
puts add_two_numbers2(l1, l2)