# Virus Predictor

# I worked on this challenge with with: Jason Buss.
# We spent a little more than an hour on this challenge.

# EXPLANATION OF require_relative
# Linking to a file and allows the current file access to the data in the linked file
# It's different from require because it's using a relative path rather than absolute
require_relative 'state_data'

class VirusPredictor

# Initializing each instance of the class with data that will be used as instance variables
# The data is passed in as parameters when it's initialized

  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # Calls the predicted_deaths and speed_of_spread methods at one time

  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

# It takes population_density and population as variables and calculates the number of 
# deaths based on how dense the population and the population multiplied by some factor
# and then prints out the results to the console

  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      factor = 0.4
    elsif @population_density >= 150
      factor = 0.3
    elsif @population_density >= 100
      factor = 0.2
    elsif @population_density >= 50
      factor = 0.1
    else
      factor = 0.05
    end

    number_of_deaths = (@population * factor).floor

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  # Based on how dense the population is, it sets a speed variable and then
  # prints it out to console

  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.

    if @population_density >= 200
      speed = 0.5
    elsif @population_density >= 150
      speed = 1
    elsif @population_density >= 100
      speed = 1.5
    elsif @population_density >= 50
      speed = 2
    else
      speed = 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects


STATE_DATA.each do |state, data|

  state = VirusPredictor.new(state, data[:population_density], data[:population])
  state.virus_effects

end


#=======================================================================
# Reflection Section
#
# ** What are the differences between the two different hash syntaxes shown in the state_data file?
#
# The 'outer' hash uses strings as key names while the 'inner' hash uses symbols as the key names.
# Since the virus predictor program prints out the key names, it's more useful to use a string
# in that case.
#
# ** What does require_relative do? How is it different from require?
#
# 'require_relative' loads another Ruby file into the program so that you can access the program data
# inside that file. it's different from 'relative' because it uses a relative path, whereas
# 'require' uses the absolute path to the file
#
# What are some ways to iterate through a hash?
#
# There are several methods, such as #each which goes through each key/value pair, #keep_if which goes
# through each k/v pair and keeps it if it matches a condition, #delete_if which goes through each k/v
# paid and deletes it if it matches the condition you set
#
# When refactoring virus_effects, what stood out to you about the variables, if anything?
#
# Since we were using instance variables, there was no need to actually pass in those local variables
# since instance variables are accessible anywhere in the class definition
#
# What concept did you most solidify in this challenge?
#
# The idea of scope and how depending on the scope of a variable, you can refactor your code
# to make it more understandable
