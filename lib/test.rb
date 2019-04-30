nums1 = [1, 3, 4, 5]
nums2 = []

def merge(nums1, nums2)
  res = []
  i = 0
  j = 0
  while !nums1.empty? && !nums2.empty?
    if nums1[0] <= nums2[0]
      res << nums1.shift
    else
      res << nums2.shift
    end
  end
  if !nums1.empty? 
    res + nums1
  elsif !nums2.empty?
    res + nums2
  else
    res
  end
end

p merge(nums1, nums2)