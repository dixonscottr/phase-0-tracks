class Puppy

  def initialize
    puts "initializing new puppy instance"
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(num)
    puts "Woof " * num
  end

  def bark(num_barks)
  i = 0
    while i < num_barks
    puts "Woof! Woof!"
    i +=1
    end
  end

  def roll_over
    puts "*rolls over*"
  end

  def dog_years(human_years)
     puts 7 * human_years
  end

  def make_circles(rounds)
    counter = 1
    puts "Starting to run in circles..."
    while counter <= rounds
      puts "#{counter} circle is done"
      counter +=1
    end
    puts "Done with it!"
  end

end

spot = Puppy.new

spot.speak(3)
spot.bark(3)
spot.roll_over
spot.dog_years(3)
spot.make_circles(3)


#new Class

class Robot

  def initialize
    puts "WELCOME TO ROBOTLAND, NEW ROBOT!"
  end

  def robot_dance
    puts "I'm dancing like a pro"
  end

  def exterminate(target)
    puts "EXTERMINATE ALL #{target}"
  end

end

new_robots = []

50.times do
new_robots << Robot.new 
end


# p new_robots

new_robots.each do |robot|
  robot.robot_dance
  robot.exterminate("HUMANS")
end






