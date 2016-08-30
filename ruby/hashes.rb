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

print "Does the customer have pets? (true or false): "
answer = gets.chomp.downcase

if answer == "true" || answer == "t"
  customer_form[:has_pets] = true
else
  customer_form[:has_pets] = false
end

#print the completed hash to the screen
puts " "
puts customer_form.each {|x, y| puts x.to_s + ": " + y.to_s}
puts " "

#Ask the user if they would like to update any keys
puts "Which key would you like to update? (Type 'none' to skip)"
key_value = gets.chomp.to_sym

if  customer_form.include?(key_value) == false && key_value != :none

  puts "Sorry, we don't have the capabilities to accept #{key_value}, yet"

elsif key_value != :none

  case key_value

  when :has_pets

    puts "The current value is: #{customer_form[key_value]}"
    puts "What would you like to change it to? (true or false)"
    new_pets_value = gets.chomp.downcase

    if new_pets_value = "true" || new_pets_value == "t"
      customer_form[:has_pets] = true
    else
      customer_form[:has_pets] = false
    end

  when :budget

    puts "The current value is: #{customer_form[key_value]}"
    puts "What would you like to change it to? (in US$)"
    new_amt = gets.chomp.delete("$")
    customer_form[:budget] = new_amt.delete(",").to_i

  when :num_rooms || :children_num || :age

    puts "The current value is: #{customer_form[key_value]}"
    puts "What would you like to change it to?"
    customer_form[key_value] = gets.chomp.to_i

  when :name || :hometown || :current_city || :color || :decor

    puts "The current value is: #{customer_form[key_value]}"
    puts "What would you like to change it to?"
    customer_form[key_value] = gets.chomp
  end

  puts " "
  puts "Here is the updated form: "
  puts customer_form.each {|x, y| puts x.to_s + ": " + y.to_s}
    
end
#If user chooses a key, ask them for the input and update with the new value

#If the user chooses "none", do nothing

#print the latest version of the hash





