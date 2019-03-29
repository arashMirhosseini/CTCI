def max_profit(prices)
  return 0 if prices.size < 2
  p = 0
  if prices[1] > prices[0]
    p = prices[1] - prices[0]
  end
  return p + max_profit(prices[1..-1])
end

p max_profit([7,6,4,3,1])