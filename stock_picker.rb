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

priceA = [17,3,6,9,15,8,6,1,10]
p stock_picker(priceA) #Should return [1, 4]
priceB = [26,3,6,2,15,8,6,22,1]
p stock_picker(priceB) #Should return [3, 7]
priceC = [44, 30, 24, 32, 35, 30, 40, 38, 15]
p stock_picker(priceC) #Should return [2, 6]
priceD = [55,1,5,2,5,3,7,6]
p stock_picker(priceD) #Should return [1, 6]
priceE = [40,20,10,11,4]
p stock_picker(priceE) #Should return [2, 3]
priceF = [40,20,10,6,4]
p stock_picker(priceF) #Should return nil
priceG = [5,8,4,40,6,1,2,33]
p stock_picker(priceG) #Should return [2,3]