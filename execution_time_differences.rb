require 'byebug'
# def my_min(arr)
#   arr.each_with_index do |el, i|
#     smallest = true
#     arr.each_with_index do |el2, j|
#       unless i == j
#         smallest = false if el2 < el
#       end
#     end
#     return el if smallest
#   end
# end

def my_min(arr)
  min = arr.first
  arr.each do |el|
    min = el if el < min
  end
  min
end

# p my_min([8,3,6,2,7,8,3,5])



def largest_continguous_subsum(list)
  subsets = []
  max_number = nil

  list.each_with_index do |el, idx|
    i = idx
    while i < list.length
      subsets << list[idx..i]

      i += 1
    end
  end

  subsets.each do |subset|
    sum = subset.inject { |sum, n| sum + n }
    max_number = sum if max_number.nil? || sum > max_number
  end
  max_number
end

def largest_continguous_subsum(list)
  max_sum = 0
  current_sum = 0
  list.each do |el|
    if el > 0 || current_sum + el >0
      current_sum += el
    else
      current_sum = 0
    end
    max_sum = current_sum if current_sum > max_sum
  end
  max_sum
end

# list = [2,-1]
list = [5, 3, -7, 6]
p largest_continguous_subsum(list)
