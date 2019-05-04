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