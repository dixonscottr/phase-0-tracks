puts "Welcome to Werewolf Inc."

#ask how many employees to process
puts "How many employee would you like to process?"
employee_num = gets.chomp.to_i

#run loop for each employee
for i in 1..employee_num

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

  #check for allergy to 'sunshine'
  puts "Any allergies? (Type 'done' when finished)"
  allergy=gets.chomp
  until (allergy == "sunshine") || (allergy == "done")
    allergy=gets.chomp
  end

  vampire_status = "Results inconclusive"

  if (age == (2016-year_born)) && (garlic_bread == "y" || health_insurance == "y")
    vampire_status = "Probably not a vampire"
  end

  if allergy == "sunshine"
    vampire_status = "Probably a vampire"
  end

  if !(age == (2016-year_born)) && (garlic_bread == "n" || health_insurance == "n")
    vampire_status =  "Probably a vampire"
  end

  if !(age == (2016-year_born)) && garlic_bread == "n" && health_insurance == "n"
    vampire_status =  "Almost certainly a vampire"
  end

  if name == "Drake Cula" || name == "Tu Fang"
    vampire_status = "Definitely a vampire"
  end

  puts vampire_status
  puts " "

end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends!"

