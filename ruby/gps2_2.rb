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
 
=begin
Method to check if hash has a key:
Input: hash, key
Steps: Check to see if hash contains a key
Output: Boolean
=end
def has_item(hash, key)
    if hash.has_key?(key.downcase)
        return true
    else
        return false
    end
end
# hash = {"hi" => "hello", "sup" => "how are you"}
# puts has_item(hash, "hi")
# puts has_item(hash, "bye")
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
def create_list(input)
  # Lowercase the input and seperate individual items by spaces, then store it
  array = input.downcase.split(" ")
  # Create a new empty list
  list = {}
  # Iterate through the stored item names and store each one in the list with its value as 0--the default quantity
  array.map { |x| list[x] = 0 }
  # Print the list to the console
  puts "Here is the updated list: #{list}"
  # output: a new hash with item names and keys and quantity (the default of 0) as values
  list
end
# Method to add an item to a list
# input: item name, optional quantity(default of 0), list
def add_item(item, quantity=0, list)
  # Check if the list already has the lowercased item name
  # IF the list already has the item name, print a warning that the item doesn't exist
  if has_item(list, item)
    # Add the item name with the optional quantity to the end of the list
    puts "We already have #{item.downcase}!"  
  # IF the list doesn't have the item name
  elsif !has_item(list, item)
    list[item.downcase] = quantity
    puts "Here is the updated list: #{list}"
  end
  list
end
# Method to remove an item from the list
# input: item name, list
def remove_item(item, list)
# steps:
#   Check if the list has the lowercased item name
#   IF the list has the item name, delete the item along with its quantity value
    if has_item(list, item)
        list.delete(item)
        # Print out the updated list hash to the console
        puts "Here is the updated list: #{list}"
#   IF the list doesn't have the item name
    else
#       Print a warning to the console that the item doesn't exist
        puts "'#{item.capitalize}' isn't on the list!"
    end
    list
end
# output: an updated hash
# Method to update the quantity of an item
# input: item name, quantity, list
def change_qty(item, quantity, list)
    #   Check if the list has the lowercased item name
    #   IF the list has the item name
    if has_item(list, item)
        # Update the item name's quantity value to be the new quantity from the input 
        list[item.downcase] = quantity
        #       Print out the updated list hash to the console
        puts "Here is the updated list: #{list}"
    #   IF the item isn't in the list
    else
        # Print a warning to the console that the item doesn't exist
        puts "#{item.capitalize} is not on the list!"
    end
    # output: an updated hash
    list    
end
# Method to print a list and make it look pretty
# input: list
def print_list(list)
    #   Print an introduction to the list to the console
    puts "Groceries I need to buy:"
    #   Print out each item name with its quantity as "Item name: Quantity"
    list.each {|item, qty| puts "*  #{item.capitalize}: #{qty}"}
end
# OUR DRIVER CODE:
# input = "carrots apples"
# new_list = create_list(input)
# add_item("juice", 2, new_list)
# add_item("bananas", new_list)
# new_list = add_item("Apples", 45, new_list)
# new_list = remove_item("bananas", new_list)
# change_qty("carrots", 3, new_list)
# print_list(new_list)
# DBC DRIVER CODE:
input = ""
new_list = create_list(input)
add_item("Lemonade", 2, new_list)
add_item("Tomatoes", 3, new_list)
add_item("Onions", 1, new_list)
new_list = add_item("Ice cream", 4, new_list)
new_list = remove_item("Lemonade", new_list)
change_qty("Ice cream", 1, new_list)
print_list(new_list)