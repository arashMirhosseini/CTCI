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
