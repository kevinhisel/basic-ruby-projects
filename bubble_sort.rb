def bubble_sort(array)
  n = 0
  until n >= array.length do
    array.each_with_index do | num, i |
      break if (i + 1) == (array.length - n)
      if num > array[i + 1]
        temp = array[i + 1]
        array[i + 1] = array[i]
        array[i] = temp
      end
    end
    n += 1
  end
  array
end

p bubble_sort([4,3,78,2,0,2])
p bubble_sort([5, 22, 633, 2, 12, 5, 99])