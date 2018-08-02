require 'byebug'

def my_min(arr)
  arr.each_with_index do |el, idx|
    is_smallest = true
    arr.each_with_index do |el2, idx2|
# `     smallest_num = el if el< el2
      is_smallest = false if el>el2
    end
    return el if is_smallest
  end
  nil
end

def my_min_iterate(arr)
  smallest_num = arr.first
  arr.each { |el| smallest_num = el if el < smallest_num }
  smallest_num
end

def sub_sum(arr) #O(n^2) because of the nested loop
   sub_sets = []
   (0...arr.length-1).each do |idx1|
     (idx1+1...arr.length).each do |idx2|
       sub_sets << arr[idx1..idx2]
     end
   end

   sub_sets.map! { |sub_arr| sub_arr.reduce(&:+) }
   largest_sum = arr.first
   sub_sets.each { |sum| largest_sum = sum if sum > largest_sum }
   largest_sum
end


def better_sub_sum(arr) #O(n)
  #worst_case scenarios are when largest sum is entire range of array
  largest_sum = arr.first #O(1)
  current_sum = arr.first #O(1)
  idx_stops_growing = 0 #O(1)
  return arr.max if arr.all? { |num| num < 0 }

  (1...arr.length).each do |idx|  #O(n-1) => O(n)
    current_sum += arr[idx]#O(1)
    if current_sum > largest_sum#O(1)
      idx_stops_growing = idx#O(1)
      largest_sum = current_sum#O(1)
    end
  end
  idx_stops_shrinking = idx_stops_growing-1 #O(1)

  smallest_sum = arr[idx_stops_shrinking] #O(1)
  current_sum = smallest_sum #O(1)
  (idx_stops_shrinking).downto(0).each do |idx| #O(n-1) => O(n)
    current_sum -= arr[idx]#O(1)
    if current_sum < smallest_sum#O(1)
      idx_stops_shrinking = idx#O(1)
      smallest_sum = current_sum#O(1)
    end
  end
  largest_sum = arr[idx_stops_shrinking]#O(1)

  (idx_stops_shrinking+1..idx_stops_growing).each { |idx| largest_sum += arr[idx]} #O(n-1) => O(n) (worst-case)
  largest_sum#O(1)
end
