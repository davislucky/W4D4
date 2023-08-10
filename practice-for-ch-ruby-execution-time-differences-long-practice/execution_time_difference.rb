def my_min(list)
    list.each do |val1, i1|
        min = true

        list.each_with_index do |val2, i2|
            next if i1 == i2
            if val2 < val1
                min = false
            end
        end
        if min
            return val1
        end
    end
end
#time complexity = n^2

def my_min_two(list)
    min = list.first

    list.each do |val|
        min = val if val < min
    end
    min
end
#time complexity = n

def largest_contiguous_subsum(list)
    sum_list = []
    (0...list.length).each do |i1|
        (i1...list.length).each do |i2|
            sum_list << list[i1..i2]
        end
    end

    max = sum_list.first.sum
    sum_list.each do |val1|
        max = val1.sum if val1.sum > max
    end
    max
end
#time complexity = n^2

def largest_contiguous_subsum_two(list)
    current_sum = list.first # 5
    largest_sum = list.first # 5

    (1...list.length).each do |idx|
        next_val = current_sum + list[idx] # 1
        current_sum = next_val if next_val > 0 && next_val > list[idx]
        if next_val < 0
            current_sum = list[idx]
        end
        largest_sum = current_sum if current_sum > largest_sum
    end

    largest_sum
end

list = [5, 3, -7]
p largest_contiguous_subsum_two(list) # => 8

#stop tracking when go below 0 and next number is greater then curr sum

#current_sum = -1
#largest_sum = 5
#list = [5, -6, 7, -6, 7]

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1
