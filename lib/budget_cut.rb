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

def findGrantsCap(grantsArray, newBudget)
    n = grantsArray.length

    # sort the array in a descending order.
    grantsArray.sort!.reverse

    # pad the array with a zero at the end to
    # cover the case where 0 <= cap <= grantsArray[i]
    grantsArray.push(0)

    # calculate the total amount we need to
    # cut back to meet the reduced budget
    surplus = sum(grantsArray) - newBudget

    # if there is nothing to cut, simply return
    # the highest grant as the cap. Recall that
    # the grants array is sorted in a descending
    # order, so the highest grant is positioned
    # at index 0
    if (surplus <= 0):
        return grantsArray[0]

    # start subtracting from surplus the
    # differences (“deltas”) between consecutive
    # grants until surplus is less or equal to zero.
    # Basically, we are testing out, in order, each
    # of the grants as potential lower bound for
    # the cap. Once we find the first value that
    # brings us below zero we break
    for i from 0 to n-1:
        surplus -= (i+1) * (grantsArray[i] - grantsArray[i+1]):
        if (surplus <= 0):
            break

    # since grantsArray[i+1] is a lower bound
    # to our cap, i.e. grantsArray[i+1] <= cap,
    # we  need to add to grantsArray[i+1] the
    # difference: (-total / float(i+1), so the
    # returned value equals exactly to cap.
    return grantsArray[i+1] + (-surplus / float(i+1))


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