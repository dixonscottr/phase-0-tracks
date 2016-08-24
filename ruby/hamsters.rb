puts "What is the hamster's name?"
name = gets.chomp
puts "How loud is this hamster on a scale of 1 to 10 (10 being the loudest)"
volume = gets.chomp.to_i
puts "What is the fur color?"
fur = gets.chomp
puts "Is this hamster good for adoption? (y/n)"
adopt = gets.chomp
if adopt == "y"
  adopt = true
elsif adopt == "n"
  adopt = false
end 
puts "How old is the hamster? (estimated)"
age = gets.chomp
if age == ""
 age = nil
else
  age = age.to_i
end

p name
p volume
p fur
p adopt
p age
