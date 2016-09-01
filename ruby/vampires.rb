puts "Welcome to the Werewolf Inc. Vampire Detector"

#ask how many employees to process
puts "How many employees would you like to process?"
employee_num = gets.chomp.to_i

#check if the age is real by comparing it to the current year - the age
def real_age_checker(age, year_born)
  current_year = Time.new.year
  if current_year - year_born == age
    true
  else
    false
  end
end

#run loop for each employee
counter = 0
while counter < employee_num

  #ask for the name
  puts "What is the employee's name?"
  name = gets.chomp

  #ask for age and year of birth
  puts "How old is the employee?"
  age = gets.chomp.to_i
  puts "What year was the employee born?"
  year_born = gets.chomp.to_i
  real_age = real_age_checker(age, year_born)

  #ask if they want garlic bread
  puts "Would the employee like to have the garlic bread in the company cafeteria? y/n"
  garlic_bread = gets.chomp

  #ask if they'd like health insurance
  puts "Would the employee like to enroll in our health insurance? y/n"
  health_insurance = gets.chomp

  #check for allergy to 'sunshine'
  puts "Does the employee have any allergies? (Type 'done' when finished)"
  allergy=gets.chomp

  until (allergy == "sunshine") || (allergy == "done")
    allergy=gets.chomp
  end

    if name == "Drake Cula" || name == "Tu Fang"
      vampire_status = "Definitely a vampire"

    elsif !real_age && garlic_bread == "n" && health_insurance == "n"
      vampire_status =  "Almost certainly a vampire"

    elsif allergy == "sunshine"
      vampire_status = "Probably a vampire"

    elsif !real_age && (garlic_bread == "n" || health_insurance == "n")
      vampire_status =  "Probably a vampire"

    elsif real_age && (garlic_bread == "y" || health_insurance == "y")
      vampire_status = "Probably not a vampire"

    else

      vampire_status = "Results inconclusive"

    end
  
  puts " "
  puts "Results: " + vampire_status
  puts " "

  counter += 1

end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends!"

