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

