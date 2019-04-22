# public List<List<Integer>> subsets(int[] nums) {
#     List<List<Integer>> list = new ArrayList<>();
#     Arrays.sort(nums);
#     backtrack(list, new ArrayList<>(), nums, 0);
#     return list;
# }

def subsets(nums)
  list = []
  nums.sort!
  backtrack(list, Array.new, nums, 0)
  p list.size
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
  list << Array.new(temp_list)
  for i in start...nums.length do 
    temp_list << nums[i]
    backtrack(list, temp_list, nums, i + 1)
    temp_list.pop
  end
end

nums = [1,2,3,4]
p subsets(nums)
