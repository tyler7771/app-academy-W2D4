def two_sum?(arr, target)
  arr.each_with_index do |el, i|
    j = i + 1
    while j < arr.length
      return true if el + arr[j] == target
      j += 1
    end
  end
  false
end

def okay_two_sum?(arr, target)
  arr = arr.sort

  arr.each_with_index do |el, idx|
    complement = target - el
    search_idx = binary_search(arr, complement)
    unless search_idx.nil? || idx == search_idx
      return true
    end
  end
  false
end

def binary_search(arr, target)
  return nil if arr.length == 0

  mid = arr.length / 2
  case arr[mid] <=> target
  when -1
    binary_search(arr.take(mid), target)
  when 0
    return mid
  when 1
    i = binary_search(arr.drop(mid + 1), target)
    i.nil? ? nil : (mid + 1) + i
  end
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false

def hash_two_sum?(arr, target)
  hash_of_elements = Hash.new { |h,k| h[k] = 0 }

  arr.each do |el|
    complement = target - el
    return true if hash_of_elements.has_key?(complement)
    hash_of_elements[el] += 1
  end
  false
end

arr = [0, 1, 5, 7]
p hash_two_sum?(arr, 6) # => should be true
p hash_two_sum?(arr, 10) # => should be false
