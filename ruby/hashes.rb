#Create an empty hash
customer_form = {}

#Welcome user and explain program
puts "Welcome to the Interior Design Form Putter Inner"
puts "Where we help you organize information about your client"
puts " "
puts "Please enter the following information about your client:"

#Ask user for input regarding client's name, age, hometown, current city, number of children, decor theme
#color preference, whether they have pets, number of rooms they want redecorated, budget

#store the above data as a key value pair in the hash

print "Name: "
customer_form[:name] = gets.chomp

print "Age: "
customer_form[:age] = gets.chomp.to_i

print "Hometown: "
customer_form[:hometown] = gets.chomp

print "Current city: "
customer_form[:current_city] = gets.chomp

print "Number of children: "
customer_form[:children_num] = gets.chomp.to_i

print "Favorite color: "
customer_form[:color] = gets.chomp

print "Desired decor theme: "
customer_form[:decor] = gets.chomp

print "Number of rooms to redecorate: "
customer_form[:num_rooms] = gets.chomp.to_i

print "Budget in US$: "
amt = gets.chomp.delete("$")
customer_form[:budget] = amt.delete(",").to_i

print "Does the customer have pets? (y/n): "
answer = gets.chomp.downcase
if answer == "y" || answer == "yes"
  customer_form[:pets] = true
else
  customer_form[:pets] = false
end

#print the completed hash to the screen

puts customer_form

#Ask the user if they would like to update any keys

#If user chooses a key, ask them for the input and update with the new value

#If the user chooses "none", do nothing

#print the latest version of the hash





