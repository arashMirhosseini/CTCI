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
def buy_sell1(pricess)
  
end

