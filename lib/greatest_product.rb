# [1,2,3,4,5]  graetest product of three of them 

#O(n^3)
# O(n)

def greatest_product(arr)
  res = []
  for i in 0...arr.size
    for j in 0...arr.size
      for k in 0...arr.size
        res << arr[i] * arr[j] * arr[k]
      end
    end
  end
  res.max
end

# [-9, -8, 0, 1,2,8] -9 * -8 * 8
  # -9 * -8 = 72
  # 2 * 8 = 16
  # return 72 * 8
# 
# O(nlog n)
# [-3, 9, 8, -10, 1, 3]
def greates_prdouct1(nums)
  return nil if nums.size < 3
  nums.sort! # [-10, -3, 1, 3, 8, 9]

  first_prd = nums[0] * nums[1] # 30

  last_prd = nums[-1] * nums[-2] # 8 * 9 = 72


  nums[-1]*first_prd > nums[-3]*last_prd ? (return nums[-1]*first_prd) : (return nums[-3]*last_prd)
  # return 72 * 3 = 21
  # 30 * 9 = 270
end

# [-3, 9, 8, -10, 1, 3]
# O(n) time
# O(1) space
def greates_prdouct2(arr)
  return nil if arr.size < 3
  max_num = arr.max   # 9
  min_num = arr.min   # -10
  min_second = 1.0/0
  arr.each do |el| 
    if el < min_second && el != min_num
      min_second = el
    end
  end
  # min_second = -3
  first_prd = min_num * min_second  # -3 * -10 = 30
  max_second = -1.0/0
  arr.each do |el|
    if el > max_second && el != max_num
      max_second = el
    end
  end
  # max_second = 8
  max_third = -1.0/0
  arr.each do |el|
    if el > max_third && el != max_num && el != max_second
      max_second = el
    end
  end
  # max_third = 3
  last_prd = max_num * max_second # 8 * 9 = 72

  max_num*first_prd > max_third*last_prd ? (return max_num*first_prd) : (return max_third*last_prd) 
  # return 72 * 3
end

def max_product(nums)
  return nil if nums.empty?
  
  curr_prd = 1
  max = -1.0/0
  nums.each do |num|
    
    if (curr_prd * num) < curr_prd
      curr_prd = num
    else
      curr_prd *= num
    end
    max = curr_prd if curr_prd > max
  end
  max
end


# ar = [722,634,-504,-379,163,-613,-842,-578,750,951,-158,30,-238,-392,-487,-797,-157,-374,999,-5,-521,-879,-858,382,626,803,-347,903,-205,57,-342,186,-736,17,83,726,-960,343,-984,937,-758,-122,577,-595,-544,-559,903,-183,192,825,368,-674,57,-959,884,29,-681,-339,582,969,-95,-455,-275,205,-548,79,258,35,233,203,20,-936,878,-868,-458,-882,867,-664,-892,-687,322,844,-745,447,-909,-586,69,-88,88,445,-553,-666,130,-640,-918,-7,-420,-368,250,-786]
# answer: 943695360
# p greates_prdouct2(ar)
nums = [0,1,8]
p max_product(nums)




