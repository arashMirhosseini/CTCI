require 'rubygems'
require 'algorithms'
include Containers

def meeting_rooms(intervals)
  intervals.sort! { |a, b| a.first <=> b.first }
  rooms = MinHeap.new([intervals[0].last])
  i = 1
  while i < intervals.size
    if intervals[i].first >= rooms.min
      rooms.pop
    end
    rooms.push(intervals[i].last)
    i += 1
  end
  rooms.size
end

# intervals = [[1, 10], [2, 7], [3, 19], [8, 12], [10, 20], [11, 30]]
intervals = [[2,15],[36,45],[9,29],[16,23],[4,9]]
p meeting_rooms(intervals)

