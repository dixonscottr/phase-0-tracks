#paired with Bex Finken

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

#release 2

#bubble sort algorithm

#Take a list of numbers

#Compare the first and second numbers, if the first is bigger than the second, switch them

#Move to the next pair of numbers (second and third) and repeat the step above

#Continue the last step above until reaching the end of the list

#Continue the last three steps until all numbers are appropriately swapped


array = [6,0,1,2,5]
another_array =[1,2,3,4,5]
yet_another = [900, 1, 5, 78, 9, 1, 3, 2]
#[0,6,1,2,5]
#[0,1,6,2,5]
#[0,1,2,6,5]
#[0,1,2,5,6]

def bubble_sort(array)

  needs_sorting = true

  while needs_sorting

    needs_sorting = false

    for i in (0..array.length-2)
      # puts "1: " + array[i].to_s + ", 2: " + array[i + 1].to_s
      if array[i] > array[i+1]
        array[i+1], array[i] = array[i], array[i+1]
        needs_sorting = true
      end
    end

  end

  array

end