require 'byebug'

def bad_two_sum?(arr, target)
  # O(n^2)
  result = arr.combination(2).any? { |x,y| x + y == target }
end

def okay_two_sum?(arr, target) #O(n logn)
  sorted = arr.sort
  sorted.each_with_index do |el, idx| #O(n)
    search_target = target-el
    new_arr = arr.take(idx) + arr.drop(idx + 1)
    search_res = b_search(new_arr, search_target) #O(logn)
    return true unless search_res == -1
  end
  false
end

def b_search(arr, target) #O(logn)
  half = arr.length/2
  return half if arr[half] == target
  return -1 if arr.length == 1
  if arr[half] > target
    b_search(arr.take(half), target)
  else
    result = b_search(arr.drop(half), target)
    result += half unless result == -1
    result
  end
end

def two_sum_hsh?(arr, target) #o(n)
  hsh = Hash.new(false)
  arr.each { |el| hsh[el]=true  } #O(n)
  arr.any? { |el| hsh[el-target] } #O(n)
end
