  # pseudocode
  #
  # in d.i.a.n.e. database, create categories table with one list: name
  #
  # in d.i.a.n.e. database, create ideas table if note already created
  # ideas table will have 5 lists: category, description, time required, done status, cost (as 0 to 5 $s)
  #
  # in d.i.a.n.e. database, create logged events table if not already created
  # logged events table will have 5 lists: date, category, description, time taken, cost
  #
  # Accept as input: date, category, description, time and cost in list form
  # Store as a new row in the logged events table
  # IF that event's description isn't in the ideas table:
  #  Store the category, description, time taken (as time required), cost and done status as true
  # IF that event's description is in the ideas table:
  #  UPDATE the done status to true
  #
  # Accept as input: category, description, time, cost
  # Store as a new row in the ideas tables with done status as false
  #
  # Accept as input: category name
  # Store as a new row in the categories table
  # 
  # Accept as (all optional) inputs: category, time, cost
  # Print out the ideas table according set to the conditions
  # IF no input:
  #   Print out the full ideas table
  # 
  # Print out the logged events table neatly

require 'sqlite3'

db = SQLite3::Database.new("diane.db")
db.results_as_hash = true

#create category table with name list
create_category_table = <<-SQL
  CREATE TABLE IF NOT EXISTS categories(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255)
  )
SQL
db.execute(create_category_table)


# #create idea table with 5 lists: category, description, time required (in minutes), done status, cost (0 to 5)
create_ideas_table = <<-SQL
  CREATE TABLE IF NOT EXISTS ideas(
    id INTEGER PRIMARY KEY,
    category_id INTEGER,
    description VARCHAR(255),
    time_required INTEGER,
    cost INTEGER,
    done_status BOOLEAN,
    FOREIGN KEY (category_id) REFERENCES categories(id)
  )
SQL
db.execute(create_ideas_table)

# #create done events with 5 lists: date, category, description, time taken, cost

create_done_table = <<-SQL
  CREATE TABLE IF NOT EXISTS done(
    id INTEGER PRIMARY KEY,
    date_done DATE,
    category_id INTEGER,
    description VARCHAR(255),
    time_taken INTEGER,
    cost INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories(id)
  )
SQL
db.execute(create_done_table)

# METHODS that check existing data

# method to check if a category already exists

def has_category(db, category_name)
  simple_categories = []
  db.execute("SELECT name FROM categories").each do |category|
    simple_categories << category['name']
  end
  simple_categories.include?(category_name) ? true : false
end

# method to see if an idea exists
# accepts database, description, and table as input
# outputs true or false

def has_description(db, description)
  descriptions = []
  db.execute("SELECT description FROM ideas").each do |idea|
    descriptions << idea['description'].downcase
  end
  descriptions.include?(description) ? true : false
end

# METHODS that add data to tables

# method to add a category to categories database
# accepts 1 argument: name

def add_category(db, category_name)
  #only add a category if it doesn't exist
  if !has_category(db, category_name)
    db.execute("INSERT INTO categories (name) VALUES (?)", [category_name])
  end
end

# method to add an idea to ideas database
# accepts 5 arguments: category, description, time required (in minutes), done status, cost (0 to 5)
def add_idea(db, category, description, time_required, cost, done = "false")
  if !has_description(db, description)
    add_data_to_ideas = <<-SQL
      INSERT INTO ideas (category_id, description, time_required, cost, done_status)
        VALUES (?,?,?,?,?)
    SQL
    c_id = convert_category_to_id(db, category)
    db.execute(add_data_to_ideas, [c_id, description, time_required, cost, done])
  end
end

# method to add a done event to the done database
# accepts 6 arguments: database, date, category, description, time taken, cost

def log_event(db, date, category, description, time_taken, cost)
  log_event_to_done = <<-SQL
    INSERT INTO done (date_done, category_id, description, time_taken, cost)
      VALUES (?, ?, ?, ?, ?)
  SQL
  #change the category name to the corresponding id
  c_id = convert_category_to_id(db, category)
  db.execute(log_event_to_done, [date, c_id, description, time_taken, cost])
  if has_description(db, description)
    #changes an idea's done status to true if it was logged
    change_to_done(db, description)
  else
    #adds the logged event as an idea for the future
    add_idea(db, category, description, time_taken, cost, done="true")
  end
end

# METHODS that update data in tables

# change done status
# input: database, description
# output: none, but changes done status in db

def change_to_done(db, description_to_match)
  ideas = db.execute("SELECT description FROM ideas")
  update_idea = "UPDATE ideas SET done_status='true' WHERE description='#{description_to_match}'"
  # loop through the ideas and looks for matching descriptions
  ideas.each do |ideas|
    if ideas['description'] == description_to_match
      db.execute(update_idea)
    end
  end
end

# METHODS that print

#method to return the number of available categories
def num_of_categories(db)
  categories = []
  db.execute("SELECT name FROM categories").each do |category|
    categories << category['name']
  end
  categories.size
end

def print_categories(db)
  system("clear")
  puts "Here are the " + num_of_categories(db).to_s + " categories of ways to treat your self:"
  db.execute("SELECT name FROM categories").each do |category|
    puts "* " + category['name'].capitalize
  end
end

def print_ideas(db)
  ideas = db.execute("SELECT * FROM ideas")
  ideas.each do |ideas|
    puts "Category: " + convert_id_to_category(db, ideas['category_id']).capitalize
    puts "Description: #{ideas['description']}"
    puts "Time required: #{ideas['time_required']} minutes"
    puts "Cost: " + make_dollar_signs(ideas['cost'])
    puts "Done? #{ideas['done_status']}"
    puts "---"
  end
end

def print_done_list(db)
  did = db.execute("SELECT * FROM done")
  did.each do |did|
    puts "Date: #{did['date_done']}"
    puts "Category: " + convert_id_to_category(db, did['category_id']).capitalize
    puts "Description: #{did['description']}"
    puts "Time taken: #{did['time_taken']} minutes"
    puts "Cost: " + make_dollar_signs(did['cost'])
    puts "---"
  end
end

# method to print out ideas not yet done

def print_done_or_not_done_list(db, done_or_not_done)
  ideas = db.execute("SELECT * FROM ideas WHERE done_status=?", [done_or_not_done])
  ideas.each do |ideas|
    puts "Category: " + convert_id_to_category(db, ideas['category_id']).capitalize
    puts "Description: #{ideas['description']}"
    puts "Time required: #{ideas['time_required']} minutes"
    puts "Cost: " + make_dollar_signs(ideas['cost'])
    puts "---"
  end
end

# method to print out according to costs

def print_according_to_cost(db, cost_max)
  ideas = db.execute("SELECT * FROM ideas WHERE cost<=?", [cost_max])
  ideas.each do |ideas|
    puts "Category: " + convert_id_to_category(db, ideas['category_id']).capitalize
    puts "Description: #{ideas['description']}"
    puts "Time required: #{ideas['time_required']} minutes"
    puts "Cost: " + make_dollar_signs(ideas['cost'])
    puts "---"
  end
end

# method to print out according to time

def print_according_to_time(db, max_minutes)
  ideas = db.execute("SELECT * FROM ideas WHERE time_required<=?", [max_minutes])
  ideas.each do |ideas|
    puts "Category: " + convert_id_to_category(db, ideas['category_id']).capitalize
    puts "Description: #{ideas['description']}"
    puts "Time required: #{ideas['time_required']} minutes"
    puts "Cost: " + make_dollar_signs(ideas['cost'])
    puts "---"
  end
end

def print_ideas_by_category(db, category)
  c_id = convert_category_to_id(db, category)
  ideas = db.execute("SELECT * FROM ideas WHERE category_id<= ?", [c_id])
  ideas.each do |ideas|
    puts "Category: " + convert_id_to_category(db, ideas['category_id']).capitalize
    puts "Description: #{ideas['description']}"
    puts "Time required: #{ideas['time_required']} minutes"
    puts "Cost: " + make_dollar_signs(ideas['cost'])
    puts "---"
  end
  # p category
  # p c_id
end

# methods that help printing

# method that finds the id # corresponding to category
# accepts a category as a name
# finds the category in the categories table
# outputs the id # of that category

def convert_category_to_id (db, category_name)
  categories = db.execute("SELECT id, name FROM categories")
  id_num = false
  categories.each do |category|
    if category['name'] == category_name.downcase
      id_num = category['id']
    end
  end
  id_num
end

def convert_id_to_category(db, id)
  categories = db.execute("SELECT * FROM categories")
  real_name = false
  categories.each do |category|
    if category['id'] == id
      real_name = category['name']
    end
  end
  real_name
end

def make_dollar_signs(num)
  "$" * num
end

def num_of_times_treated(db)
  times_treated = 0
  db.execute("SELECT description FROM done").each do |description|
    times_treated += 1
  end
  
  times_treated
  
end

####################
## USER INTERFACE ##
####################

add_category(db, "shopping")
add_category(db, "food/drink")
add_category(db, "media")
add_category(db, "social")
add_category(db, "relaxation")
add_category(db, "pamper")
add_idea(db, "social", "talk to a shoe", 5, 0, "false")
add_idea(db, "shopping", "buy a pelt", 10, 3, "false")
add_idea(db, "shopping", "buy something fancy", 50, 5, "true")
add_idea(db, "shopping", "buy a sweet coat", 40, 4, "true")
add_idea(db, "social", "sing a song badly", 13, 3, "true")
add_idea(db, "relaxation", "walk in the park", 20, 2, "false")
add_idea(db, "food/drink", "eat ice cream", 35, 1, "false")

puts "Welcome to Treat Your Self (TYR Version 1.0)"
puts "\"because you're worth it\"\n"

puts "Treat Your Self options:"
puts "1) Record how you treated yourself"
puts "2) See how you've treated yourself"
puts "3) Get a list of ideas about how to treat yourself"
puts "4) Add an idea about how to treat yourself"
puts "Type the number (or 'quit' to exit)"

option_input = gets.chomp

until option_input.downcase == 'quit'

  if option_input == "1"
    puts "I'll need 5 things from you: the date, the category of the activity, a description, approximate cost, and amount of time"
    puts "First up. What date would you like to record? (MM/DD/YYYY)"
    date = gets.chomp
    print_categories(db)
    puts "Which category would you place this activity in?"
    category = gets.chomp
    puts "Please enter a short description of how you treated yourself:"
    description = gets.chomp
    puts "On a scale from 1 to 5, how much did this activity cost?"
    puts "(1 being practically free, 5 being you maxed out your AMEX)"
    cost = gets.chomp
    puts "About how many minutes did this activity take?"
    time = gets.chomp
    log_event(db, date, category, description, time, cost)

  elsif option_input == "2"
    
    if num_of_times_treated(db) > 0
      puts "You've treated yourself " + num_of_times_treated(db).to_s + " times"
      puts "Here's a list of ways you've treated yourself:"
      print_done_list(db)
    else
      puts "You haven't treated yourself! Get on it!"
    end

  elsif option_input == "3"

    puts "How would you like to see the idea list?"
    puts "1) By category"
    puts "2) By cost"
    puts "3) By time required"
    puts "4) By whether you've done them or not"
    puts "5) All ideas"
    response = gets.chomp

    case response

      when "1"
        print_categories(db)
        puts "Which one would you like to see?"
        category_view = gets.chomp.downcase
        print_ideas_by_category(db, category_view)

      when "2"
        puts "Please enter the maximum cost on a scale from 1 to 5:"
        puts "(1 being practically free, 5 being you maxed out your AMEX)"
        max_cost = gets.chomp.to_i
        print_according_to_cost(db, max_cost)
      when "3"
        puts "Please enter the maximum number of minutes you want to spend:"
        max_time = gets.chomp.to_i
        print_according_to_time(db, max_time)
      when "4"
        puts "Would you like to see activities you've done? Or not done?"
        puts "Type 'done' or 'not done'"
        done_or_not = gets.chomp.downcase
        done_or_not == "done" ? done_or_not = "true" : done_or_not = "false"
        print_done_or_not_done_list(db, done_or_not)
      when "5"
        print_ideas(db)
      else
        puts "Sorry! I don't have that capability now."
      end

  elsif option_input == "4"

    puts "I'll need 4 things from you: category, description, cost and time required"
    print_categories(db)
    puts "Which category does your idea belong in?"
    idea_category = gets.chomp
    puts "Please enter a short description of your idea to treat yourself:"
    idea_description = gets.chomp
    puts "On a scale from 1 to 5, how much does this activity cost?"
    puts "(1 being practically free, 5 being you maxed out your AMEX)"
    cost = gets.chomp.to_i
    puts "About how many minutes does this activity take?"
    time = gets.chomp
    add_idea(db, idea_category, idea_description, time, cost)

  else
    puts "Invalid option! (Please wait for TYR Version 2.4)"
  end
  puts "Treat Your Self options:"
  puts "1) Record how you treated yourself"
  puts "2) See how you've treated yourself"
  puts "3) Get a list of ideas about how to treat yourself"
  puts "4) Add an idea about how to treat yourself"
  puts "Type the number (or 'quit' to exit)"

  option_input = gets.chomp

end

puts "Your own well being thanks you for treating yourself!"


#################
## DRIVER CODE ##
#################

# add_category(db, "shopping")
# add_category(db, "food/drink")
# add_category(db, "media")
# add_category(db, "social")
# add_category(db, "relaxation")
# add_category(db, "pamper")

# add_idea(db, 1, "talk to a shoe", 5, 0, "false")
# add_idea(db, 2, "buy a pelt", 10, 3, "false")
# add_idea(db, 5, "buy something fancy", 50, 5, "true")
# add_idea(db, 2, "buy a sweet coat", 40, 4, "true")
# add_idea(db, 3, "sing a song badly", 13, 3, "true")
# add_idea(db, 4, "walk in the park", 20, 2, "false")
# add_idea(db, 2, "eat ice cream", 35, 1, "false")

# log_event(db, '9/24/2016', 2, "talk to the queen", 15, 2)
# log_event(db, '09/07/2016', 1, "buy a pelt", 10, 5)

# print_ideas(db)
# print_done_list(db)
# p convert_category_to_id(db, "shopping")
# p convert_category_to_id(db, "friends")
# p convert_category_to_id(db, "media")

# puts "has_category check"
# p has_category(db, "shopping")
# p has_category(db, "friends")
# puts "..."

# p has_description(db, "buy a pelt", "ideas")
# p has_description(db, "buy a coat", "ideas")
# p has_description(db, "buy a coat", "done")
# p has_description(db, "talk to the queen", "done")

# p make_dollar_signs(0)
# p make_dollar_signs(5)

# print_categories(db)

# change_to_done(db, "talk to a shoe")

# puts "not done list:"
# print_done_or_not_done_list(db, "true")
# puts "done list"
# print_done_or_not_done_list(db, "false")

# # JOINS: 
# # SELECT done.date_done, categories.name, done.description, done.time_taken, done.cost
# # FROM done
# # JOIN categories ON done.category_id = categories.id;

# p convert_id_to_category(db, 2)
# p convert_id_to_category(db, 3)

# puts "print out list under 5 cost"
# print_according_to_cost(db, 5)
# puts "under 3 cost"
# print_according_to_cost(db, 3)

# puts "under 30 minutes"
# print_according_to_time(db, 30)
# puts "under 10 minutes"
# print_according_to_time(db, 10)

# puts "all shopping"
# print_ideas_by_category(db, "shopping")
# puts "food/drink"
# print_ideas_by_category(db, "food/drink")