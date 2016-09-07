class Santa

  attr_reader :age, :ethnicity
  attr_accessor :gender

  def initialize(gender, ethnicity, age)
    puts "Initializing Santa instance..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = age
  end
  
  def speak
    puts "Ho ho ho! Happy Holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}"
  end

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(bad_reindeer)
    @reindeer_ranking.delete(bad_reindeer)
    @reindeer_ranking << bad_reindeer
  end

  # def gender=(new_gender)
  #   @gender = new_gender
  # end

  # def age
  #   @age
  # end

  # def gender
  #   @gender
  # end

end

# st_nick = Santa.new
# st_nick.speak
# st_nick.eat_milk_and_cookies("gingersnap")

# santas = []

genders = ["male", "female", "gender fluid", "trans*", "agender", "other", "prefer not to say"]

ethnicities = ["black", "white", "Asian", "Native American", "Latino", "Arab", "Persian", "Aboriginal Australian", "other"]

# 10.times do
#   gender = genders.shuffle.first
#   ethnicity = ethnicities.shuffle.first
#   santas << Santa.new(gender, ethnicity)
# end

# p santas[8]

# p santas[8].celebrate_birthday
# p santas[8].celebrate_birthday
# p santas[8].celebrate_birthday

# p santas[8]
# p santas[8].get_mad_at("Dasher")

# p santas[8]
# p santas[8].gender = "female"

# p santas[8].age
# p santas[8].gender

santa_num = 1

10.times do
  gender = genders.sample
  ethnicity = ethnicities.sample
  age = rand(0..140)
  puts ""
  puts "Creating Santa no. #{santa_num}"
  santa = Santa.new(gender, ethnicity, age)

  puts "Gender: #{santa.gender}"
  puts "Ethnicity: #{santa.ethnicity}"


  santa_num += 1
end




