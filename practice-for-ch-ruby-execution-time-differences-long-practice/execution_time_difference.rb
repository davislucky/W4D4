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

