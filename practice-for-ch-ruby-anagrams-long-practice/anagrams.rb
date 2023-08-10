def anagrams_1?(word1, word2)
    base = permutations(word1)
    base.include?(word2)
end

def permutations(str)
    return [str] if str.length <= 1
    chars = str.split("")

    last_ele = chars.pop
    perms = permutations(chars.join(""))
    total_permutations = []
    perms.each do |perm|
        (0..perm.length).each do |i|
            total_permutations << perm[0...i].to_s + last_ele.to_s + perm[i..-1].to_s
        end
    end
    total_permutations
end

# time complexity -> O(n!)

def second_anagram?(word1, word2)
    letters = word2.split("")
    word1.each_char do |char|
        if letters.find_index(char)
            letters.delete_at(letters.find_index(char))
        else
            return false
        end
    end
    letters.empty?
end

# time complexity -> n^3


def third_anagram?(word1, word2)
    letters1 = word1.split("")
    letters2 = word2.split("")
    letters1.sort == letters2.sort
end


#time complexity -> at best O(n log n) and worst is O(n^2)

def fourth_anagram?(word1, word2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    word1.each_char do |char|
        hash1[char] += 1
    end

    word2.each_char do |char|
        hash2[char] += 1
    end

    hash1 == hash2
end

#time complexity -> 4n


def fourth_anagram_2?(word1, word2)
    hash = Hash.new(0)

    word1.each_char do |char|
        hash[char] += 1
    end

    word2.each_char do |char|
        hash[char] -= 1
    end
    hash.values.all? { |v| v == 0 }
end

#time complexity -> 3n
