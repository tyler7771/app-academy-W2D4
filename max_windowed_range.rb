require_relative 'queue'

 # naive solution
# def windowed_max_range(arr, w)
#   current_max_range = 0
#
#   arr.each_index do |idx|
#     break if (arr.length + 1) - w == idx
#     window = arr[idx...(idx + w)]
#     current_range = window.max - window.min
#     if current_range > current_max_range
#       current_max_range = current_range
#     end
#   end
#   current_max_range
# end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

# optimized solution
def optimized_max_range(arr, w)
  idx = w
  queue = StackQueue.new
  w.times do |queue_idx|
    queue.enqueue(arr[queue_idx])
  end

  current_max_range = queue.max - queue.min

  while idx < arr.length
    queue.dequeue
    queue.enqueue(arr[idx])
    current_range = queue.max - queue.min

    if current_range > current_max_range
      current_max_range = current_range
    end
    idx += 1
  end
  current_max_range
end

p optimized_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p optimized_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p optimized_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p optimized_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
