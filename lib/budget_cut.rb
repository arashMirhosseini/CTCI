# Award Budget Cuts

# Given an array grantsArray of the original grants and the 
# reduced budget newBudget, write a function findGrantsCap that 
# finds in the most efficient manner a cap such that the least 
# number of recipients is impacted and that the new budget 
# constraint is met (i.e. sum of the N reallocated grants equals 
# to newBudget).

def find_grants_cap(grantsArray, newBudget)
  grantsArray.sort!
  sum_curr_budget = 0
  i = 0
  while i < grantsArray.size
    sum_curr_budget += grantsArray[i]
    break if sum_curr_budget > newBudget
    i += 1
  end
  
  if sum_curr_budget < newBudget
    return grantsArray.max
  end

  num_surplus_recepient = grantsArray.size - i 

  (newBudget - (sum_curr_budget - grantsArray[i])).to_f / num_surplus_recepient




end


# grantsArray = [2,100,50,120,167] 
# newBudget = 400
# Expected output:
# 128.0

# grantsArray = [210,200,150,193,130,110,209,342,117] 
# newBudget = 1530
# expected output: 211

grantsArray = [21,100,50,120,130,110]
newBudget = 140
# Expected output:
# 23.8

p find_grants_cap(grantsArray, newBudget)