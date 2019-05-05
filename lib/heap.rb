# implement heap 

class Heap
  def initialize(arr)
    @arr = arr
  end

  def build_heap
    n = arr.size / 2 - 1
    n.downto(0) do |i|
      max_heapify(arr.size, i)
    end
  end
  
  def max_heapify(size, idx)
    largest = idx
    left = left
    right = right 

    if left < size && arr[left] > arr[largest]
      largest = left
    end

    if right < size && arr[right] > arr[largest]
      largest = right
    end

    if largest != idx
      arr[largest], arr[idx] = arr[idx], arr[largest]
      max_heapify(size, largest)
    end

  end

  private
  def left(i)
    2i + 1
  end

  def right(i)
    2i + 2
  end

  def parent(i)
    (i - 1) / 2
  end

end

def build_heap(arr)
  n = arr.size
  ((n - 1)/2).downto(0) do |i|
    max_heapify(arr, n, i)
  end
  # arr
end

def max_heapify(nums, size, idx)
  largest = idx
  left = 2 * idx + 1
  right = 2 * idx + 2
  
  if left < size && nums[largest] < nums[left]
    largest = left 
  end
  if right < size && nums[largest] < nums[right]
    largest = right
  end
  if idx != largest 
    nums[idx], nums[largest] = nums[largest], nums[idx]
    max_heapify(nums, size, largest)
  end
end

def extract_max(arr, k)
  build_heap(arr)
  p arr
  res = []
  k.times do 
    arr[0], arr[-1] = arr[-1], arr[0]
    res << arr.pop
    max_heapify(arr, arr.size, 0)
  end
  p arr
  return res
end

def heap_sort(arr)
  build_heap(arr)
  (arr.size-1).downto(1) do |i|
    arr[i], arr[0] = arr[0], arr[i]
    max_heapify(arr, i, 0)
  end
  arr
end

# arr1 = [14, 7, 3, 8, 1]
# arr = [3, 19, 1, 14, 8, 7]
arr = [3,2,3,1,2,4,5,5,6,7,7,8,2,3,1,1,1,10,11,5,6,2,4,7,8,5,6]
# p heap = build_heap(arr1)
p extract_max(arr, 2)
# p heap_sort(arr)
