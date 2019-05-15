# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

def search_range(nums, target)
  i = 0
  j = nums.size - 1
  res = Array.new(2){-1}
  # find the left side
  while i < j
    mid = (i + j) / 2
    if nums[mid] == target
      j = mid
    elsif nums[mid] > target 
      j = mid
    else
      i = mid + 1
    end
  end
  return res if nums[i] != target 
  res[0] = i

  # find the right side
  while i < j
    mid = (i + j) / 2 
    if nums[mid] == target 
      i = mid
    elsif nums[mid] < target
      i = mid
    else
      j = mid - 1
  end
  res[1] = j
  res
end

