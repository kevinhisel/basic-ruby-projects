# require 'pry-byebug'

def find_index_of_lowest(array)
  index_of_lowest = nil

  array.each_with_index.reduce(array[0]) do |current_low, (possible_low, index)|
    #binding.pry
    if current_low < possible_low
      current_low
    elsif index != array.length - 1
      index_of_lowest = index
      possible_low
    end
  end
  index_of_lowest
end

def stock_picker(prices)
  find_index_of_lowest(prices)
end

p stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  for a profit of $15 - $3 == $12
# p stock_picker([17,3,6,9,15,8,6,10,1])