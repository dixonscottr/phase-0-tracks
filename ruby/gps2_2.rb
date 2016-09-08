# Method to create a list
#
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Lowercase the input and seperate individual items by spaces, then store it
  # Create a new empty list
  # Iterate through the stored item names and store each one in the list with its value as 0--the default quantity
  # Print the list to the console
# output: a new hash with item names and keys and quantity (the default of 0) as values

def create_list(input)
  array = input.downcase.split(" ")
  list = {}
  array.map do |x|
    list[x] = 0
  end
  puts list
  list
end

input = "carrots apples"

create_list(input)


# Method to add an item to a list
#
# input: item name, optional quantity(default of 0), list
# steps:
  # Check if the list already has the lowercased item name
  # IF the list doesn't have the item name
    # Add the item name with the optional quantity to the end of the list
    # print the updated list to the console
  # IF the list already has the item name, print a warning that the item doesn't exist


def add_item(item, quantity=0, list)
  if list.include?(item.downcase)
    puts "We already have that!"
  elsif !(list.include?(item.downcase))
    list[item] = quantity
    puts list
    list
  end

end

new_list = create_list(input)
add_item("juice", 2, new_list)
add_item("bananas", new_list)
add_item("Apples", 45, new_list)

#Convert input into array of items
#Set each items' name as key and value as default as quantity

# input = "carrots bacon juice"



# def add_items(array)
#   list = {}
#   array.map do |x|
#     list[x] = 0
#   end
#   list
# end

# new_list = add_items(array)





# #remove item from list

# #Take item as input and remove the item if it's in the list

# input = "Carrots"

# new_list.delete(input.downcase)

# p new_list