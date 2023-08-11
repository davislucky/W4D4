def bad_two_sum?(arr, target_sum)
    arr.each.with_index do |val1, idx1|
        arr.each.with_index do |val2, idx2|
            return true if idx2 > idx1 && val1 + val2 == target_sum
        end
    end
    false
end
# time complexity -> n^2

def okay_two_sum?(arr, target_sum)
    sorted = arr.sort
    arr.each do |val|
        sorted.shift
        return true if bsearch(sorted, target_sum - val) != nil
    end
    false
end
# time complexity -> n * log^n

def bsearch(arr, target_val)
    return nil if arr.length == 0
    mid = arr.length / 2
    if arr[mid] == target_val
        return mid
    elsif arr[mid] > target_val
        return bsearch(arr[0...mid], target_val)
    elsif arr[mid] < target_val
        result = bsearch(arr[mid+1..-1], target_val)
        return result + mid + 1 unless result.nil?
    end
end

def two_sum?(arr, target_sum)
    hash = {}
    arr.each do |ele|
        return true if hash[ele] != nil
        hash[target_sum - ele] = ele
    end

    return false
end
# time complexity -> n


#keys = indices
#values = ele at indice
#iterate through hash check .any? if va


arr = [0, 1, 5, 7]
# sorted = [0, 1, 5, 7]
#bsearch(arr, 8)
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
