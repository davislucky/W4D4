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

# time complexity -> O(n! + n!)

def second_anagram?(word1, word2)
