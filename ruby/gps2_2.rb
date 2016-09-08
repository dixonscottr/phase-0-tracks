=begin
2.2 Guided Pair Session: Ruby
Method to create a list
input: string of items separated by spaces (example: "carrots apples cereal pizza")
steps: 
  Lowercase the input and seperate individual items by spaces, then store it
  Create a new empty list
  Iterate through the stored item names and store each one in the list with its value as 0--the default quantity
  Print the list to the console
output: a new hash with item names and keys and quantity (the default of 0) as values
Method to add an item to a list
input: item name, optional quantity(default of 0), list
steps:
  Check if the list already has the lowercased item name
  IF the list doesn't have the item name
    Add the item name with the optional quantity to the end of the list
    print the updated list to the console
  IF the list already has the item name, print a warning that the item doesn't exist
output:an updated hash
Method to remove an item from the list
input: item name, list
steps:
  Check if the list has the lowercased item name
  IF the list has the item name, delete the item along with its quantity value
    Print out the updated list hash to the console
  IF the list doesn't have the item name
    Print a warning to the console that the item doesn't exist
output: an updated hash
Method to update the quantity of an item
input: item name, quantity, list
steps:
  Check if the list has the lowercased item name
  IF the list has the item name
    Update the item name's quantity value to be the new quantity from the input 
    Print out the updated list hash to the console
  IF the item isn't in the list
    Print a warning to the console that the item doesn't exist
output: an updated hash
Method to print a list and make it look pretty
input: list
steps: 
  Print an introduction to the list to the console
  Print out each item name with its quantity as "Item name: Quantity"
output: nil (since this method just prints to the console)
=end
 
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
def create_list(input)
  # Lowercase the input and seperate individual items by spaces, then store it
  array = input.downcase.split(" ")
  # Create a new empty list
  list = {}
  # Iterate through the stored item names and store each one in the list with its value as 0--the default quantity
  array.map do |x|
    list[x] = 0
  end
  # Print the list to the console
  puts list
  # output: a new hash with item names and keys and quantity (the default of 0) as values
  list
end
input = "carrots apples"
create_list(input)
# Method to add an item to a list
# input: item name, optional quantity(default of 0), list
def add_item(item, quantity=0, list)
  # Check if the list already has the lowercased item name
  # IF the list already has the item name, print a warning that the item doesn't exist
  if list.include?(item.downcase)
    # Add the item name with the optional quantity to the end of the list
    puts "We already have that!"  
  # IF the list doesn't have the item name
  elsif !(list.include?(item.downcase))
    list[item] = quantity
    puts list
  end
  list
end
# Method to remove an item from the list
# input: item name, list
def remove_item(item, list)
    p list
# steps:
#   Check if the list has the lowercased item name
#   IF the list has the item name, delete the item along with its quantity value
    if list.has_key?(item.downcase)
        list.delete(item)
        # Print out the updated list hash to the console
        puts list
#   IF the list doesn't have the item name
    else
#       Print a warning to the console that the item doesn't exist
        puts "'#{item.capitalize}' isn't on the list!"
    end
    list
end
# output: an updated hash
# DRIVER CODE:
new_list = create_list(input)
add_item("juice", 2, new_list)
add_item("bananas", new_list)
new_list = add_item("Apples", 45, new_list)
remove_item("bananas", new_list)