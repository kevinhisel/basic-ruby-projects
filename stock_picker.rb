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

def find_pair(array)
  pair = Array.new(2)
  pair[0] = find_index_of_lowest(array)
  pair[1] = find_index_of_highest(array[pair[0]..array.length], pair[0])
  pair
end

def stock_picker(prices)
  find_pair(prices)
end

p stock_picker([17,3,6,9,15,8,6,1,10])
p stock_picker([17,3,6,9,15,8,6,1])
# => [1,4]  for a profit of $15 - $3 == $12
# p stock_picker([17,3,6,9,15,8,6,10,1])