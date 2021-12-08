# require 'pry-byebug'

def find_index_of_lowest(array)
  index_of_lowest = nil

  array.each_with_index.reduce(array[0]) do |current_low, (possible_low, index)|
    if current_low < possible_low
      current_low
    elsif index != array.length - 1
      index_of_lowest = index
      possible_low
    end
  end
  index_of_lowest
end

def find_index_of_highest(array, offset = 0)
  index_of_highest = nil

  array.each_with_index.reduce(array[0]) do |current_high, (possible_high, index)|
    if current_high > possible_high
      current_high
    else
      index_of_highest = index + offset
      possible_high
    end
  end
  index_of_highest
end

def compare_pairs(array, current_pair, new_pair)
  if (array[current_pair[1]] - array[current_pair[0]]) >= 
     (array[new_pair[1]] - array[new_pair[0]])
    current_pair
  else
    new_pair    
  end
end

def find_pair(array)
  pair = Array.new(2)
  pair[0] = find_index_of_lowest(array)
  pair[1] = find_index_of_highest(array[pair[0]..array.length], pair[0])
# binding.pry
  if array[0..pair[0] - 1].length < 2
    pair    
  else
    compare_pairs(array, pair, find_pair(array[0..pair[0] - 1]))    
  end
end

def stock_picker(prices)
  find_pair(prices)
end

p stock_picker([17,3,6,9,15,8,6,1,10])
p stock_picker([17,3,6,9,15,8,6,1])
# => [1,4]  for a profit of $15 - $3 == $12
# p stock_picker([17,3,6,9,15,8,6,10,1])