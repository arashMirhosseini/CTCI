# Award Budget Cuts

# Given an array grantsArray of the original grants and the 
# reduced budget newBudget, write a function findGrantsCap that 
# finds in the most efficient manner a cap such that the least 
# number of recipients is impacted and that the new budget 
# constraint is met (i.e. sum of the N reallocated grants equals 
# to newBudget).

def find_grants_cap(grantsArray, newBudget)
  each = newBudget.to_f / grantsArray.size
  remainder = 0.0
  n = 0
  grantsArray.each do |grant|
    if grant < each 
      n += 1
      remainder += each - grant
    end
  end
  p remainder
  cap = remainder.to_f / (grantsArray.size - n)
  p cap
  return cap == 0 ? each : (cap + each)
end


grantsArray = [2,100,50,120,167] 
newBudget = 400
# Expected output:
# 128
p find_grants_cap(grantsArray, newBudget)