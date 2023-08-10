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