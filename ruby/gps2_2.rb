#create a list

#Create a list

def create_list(input)
  array = input.split(" ")
  list = {}
  array.map do |x|
    list[x] = 0
  end
  list
end

input = "carrots apples"

p new_list = create_list(input)


#add items, quantity

#Update list with new item and quantity
#Store new item and quantity in list

# def add_item_quantity(item, quantity)
#   list[item] = quantity
# end

def add_item(item, quantity=1, list)

  list[item] = quantity
  list

end

p add_item("juice", 2, new_list)

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