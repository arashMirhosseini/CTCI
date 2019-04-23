# public List<List<Integer>> subsets(int[] nums) {
#     List<List<Integer>> list = new ArrayList<>();
#     Arrays.sort(nums);
#     backtrack(list, new ArrayList<>(), nums, 0);
#     return list;
# }

def subsets(nums)
  list = []
  # nums.sort!
  backtrack(list, Array.new, nums, 0)
  # p list.size
  list
end

# private void backtrack(List<List<Integer>> list , List<Integer> tempList, int [] nums, int start){
#     list.add(new ArrayList<>(tempList));
#     for(int i = start; i < nums.length; i++){
#         tempList.add(nums[i]);
#         backtrack(list, tempList, nums, i + 1);
#         tempList.remove(tempList.size() - 1);
#     }
# }

def backtrack(list, temp_list, nums, start)
  list << temp_list.dup
  p list
  for i in start...nums.length do 
    temp_list << nums[i]
    backtrack(list, temp_list, nums, i + 1)
    temp_list.pop
  end
end

def subsets1(nums)
  return [[]] if nums.empty?
  subsets = subsets(nums[1..-1])
  res = []
  subsets.each do |subset|
    res << subset
    res << (subset.dup << nums[0])
  end
  res
end

nums = [1,2,3]
# backtrack([], temp, nums, 0)
# list = [[temp]]
# i = 0 
# temp << nums[0] --> list [[1]]
# [[1]] 
subsets(nums)