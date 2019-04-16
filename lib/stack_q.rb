# Implement a queue using stacks. That is, write enqueue and dequeue using only 
# push and pop operations.

# In terms of performance, enqueue should be O(1), but dequeue may be worst-case O(n). 
# In terms of ammortized time, dequeue should be O(1). Prove that your solution accomplishes 
# this.

class MyQueue
  attr_accessor :stack1, :stack2

  def initialize
    @stack1 = [] # push & pop
    @stack2 = []
  end

  # O(1)
  def enqueue(ele)
    stack1.push(ele)
  end

  # O(n)
  def dequeue
    while !stack1.empty?
      stack2.push(stack1.pop)
    end
    stack2.pop
  end

end

q = MyQueue.new
q.enqueue(2)
q.enqueue(3)
q.enqueue(10)
p q.dequeue
p q.dequeue


 # return 0 if prices.size < 2
  # p = 0
  # if prices[1] > prices[0]
  #   p = prices[1] - prices[0]
  # end
  # return p + max_profit(prices[1..-1])
  # return 0 if prices.size < 2
  # p = prices[1] - prices[0]
  # p = 0 if p < 0
  # return p + max_profit(prices[1..-1])
  def method
    result = []
  h1 = Hash.new(0)
  h2 = Hash.new(0)
  nums1.each { |n| h1[n] += 1 }
  nums2.each { |n| h2[n] += 1 }

  h1.each do |k1, v1|
    if h2.include? k1
      diff = [v1,h2[k1]].min
     
      diff.times { result << k1 }
    end
  end

  result
  
  end
  