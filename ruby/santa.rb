class Santa

  def initialize(gender, ethnicity)
    puts "Initializing Santa instance..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end
  
  def speak
    puts "Ho ho ho! Happy Holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}"
  end

end

# st_nick = Santa.new
# st_nick.speak
# st_nick.eat_milk_and_cookies("gingersnap")

santas = []

genders = ["male", "female", "gender fluid", "trans*", "agender", "other, ""prefer not to say"]

ethnicities = ["black", "white", "Asian", "Native American", "Latino", "Arab", "Persian", "Aboriginal Australian", "other"]

10.times do
  gender = genders.shuffle.first
  ethnicity = ethnicities.shuffle.first
  santas << Santa.new(gender, ethnicity)
end

p santas
