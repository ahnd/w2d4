def first_anagram?(str1, str2) #O(n!)
  str1.chars.permutation.to_a.map { |permutation| permutation.join }
    .include?(str2)
end

def second_anagram?(str1, str2) #O(n)
  str2_arr = str2.chars
  str1.chars.each do |char|
    str2_arr.delete(char)
  end
  str2_arr.empty?
end

def third_anagram?(str1, str2) #O(n log n)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)#O(n)
  counts = Hash.new(0)
  str1.each_char { |chr| counts[chr] += 1   }
  str2.each_char { |chr| counts[chr] -= 1   }

  counts.none? {|_, v| v < 0}
end
#
# def gen_count_hash(str)
#   counts = Hash.new(0)
#   str.each_char { |chr| counts[chr] += 1   }
#   counts
# end
