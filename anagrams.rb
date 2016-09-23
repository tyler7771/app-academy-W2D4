require 'byebug'
def first_anagram?(word1, word2)

  anagrams = word1.chars.permutation.to_a
  anagrams.include?(word2.chars)
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")


def second_anagram?(word1, word2)
  split1, split2 = word1.chars, word2.chars

  idx = 0
  while idx < split1.length
    split2.each_with_index do |el2, idx2|
      if el2 == split1[idx]
        split1.delete_at(idx)
        split2.delete_at(idx2)
        idx = -1
        break
      end
    end
    idx += 1
  end
  return false unless split1.empty? && split2.empty?
  true
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")

def third_anagram?(word1, word2)
  split1= word1.chars.sort
  split2 = word2.chars.sort
  split1 == split2
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")

def fourth_anagram?(word1, word2)
  letter_count = Hash.new { |hash, key| hash[key] = [] }

  split1= word1.chars
  split2 = word2.chars

  split1.each { |el| letter_count[el] << el }
  split2.each do |el2|
    if letter_count[el2].length > 0
      letter_count[el2].pop
    else
      return false
    end
  end

  return false if letter_count.any? { |key, value| value.count > 0 }
  true

end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")

p fourth_anagram?("helo", "hello")
