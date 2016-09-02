#release 0

def search_array(array, num)
  final_index = nil
  index = 0
  while index <= array.length
    final_index = index if array[index] == num
    index += 1
  end
  final_index
end

#release 1

def get_fib_number(fib_nums_wanted)
  fib_array = [0, 1]
  index = 0
  
  while index < (fib_nums_wanted - 2)
    first_num = fib_array[index]
    second_num = fib_array[index + 1]
    fib_num = first_num + second_num
    fib_array << fib_num
    index += 1
  end
  fib_array
end

puts get_fib_number(6) ==  [0,1,1,2,3,5]
puts get_fib_number(100).last == 218922995834555169026
p get_fib_number(5)