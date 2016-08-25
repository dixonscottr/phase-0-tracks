puts "Welcome to Werewolf Inc."

#ask for the name
puts "What is your name?"
name = gets.chomp

#ask for age and year of birth
puts "How old are you?"
age = gets.chomp.to_i
puts "And what year were you born?"
year_born = gets.chomp.to_i

#ask if they want garlic bread
puts "Would you like garlic bread in the company cafeteria? y/n"
garlic_bread = gets.chomp

#ask if they'd like health insurance
puts "Would you like to enroll in our health insurance? y/n"
health_insurance = gets.chomp

p name, age, year_born, garlic_bread, health_insurance