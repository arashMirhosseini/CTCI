# buy and sell stocks 

# we are allowed to complete any number of transaction

# recursion 
def buy_sell(prices)
  return 0 if prices.size < 2
  p = prices[1] - prices[0]
  p = 0 if p < 0
  return p + buy_sell(prices[1..-1])
end

# without recursion
def buy_sell1(prices)
  n = prices.size
  profit = 0
  min = 0
  max = 0
  i = 0
  while i < n - 1
    while i < n-1 && prices[i] >= prices[i+1]
      i += 1 
    end
    break if i == n-1
    min = prices[i]
    
    i += 1
    while i < n-1 && prices[i] <= prices[i+1]
      i += 1
    end
    max = prices[i]
    profit += max - min
  end
  profit
end

# sell and buy just one time

def buy_sell2(prices)
  return 0 if prices.size < 2
  min = prices[0]
  prof = prices[1] - prices[0]

  for i in 1...prices.size do 
    if prices[i] - min > prof
      prof = prices[i] - min
    end
    if prices[i] < min
      min = prices[i]
    end
  end
  prof > 0 ? (return prof) : (return 0)
end

def max_sum(nums)
  return nums.first if nums.size < 2
  max = -1.0/0
  
  for i in 0..nums.size-1 do 
    sub = nums[i]
    max = sub if sub > max
    for j in i+1..nums.size-1 do 
      sub += nums[j]
      max = sub if sub > max
    end
  end
  max = sub if sub > max
  max
end

# p buy_sell2([-2,1,-3,4,-1,2,1,-5,4])
# p buy_sell1([7,1,5,3,6,4])
p max_sum([-2,1,-3,4,-1,2,1,-5,4])
