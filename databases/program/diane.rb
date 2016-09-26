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

#create idea table with 5 lists: category, description, time required (in minutes), done status, cost (0 to 5)
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

# create done events with 5 lists: date, category, description, time taken, cost
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

## METHODS that check existing data

# method to check if a category already exists
def has_category(db, category_name)
  simple_categories = []
  db.execute("SELECT name FROM categories").each do |category|
    simple_categories << category['name']
  end
  simple_categories.include?(category_name) ? true : false
end

# method to see if an idea exists (through its description, which should be unique)
def has_description(db, description)
  descriptions = []
  db.execute("SELECT description FROM ideas").each do |idea|
    #put all the descriptions into one array
    descriptions << idea['description'].downcase
  end
  descriptions.include?(description) ? true : false
end

## METHODS that add data to tables

# method to add a category to categories database
def add_category(db, category_name)
  #only add a category if it doesn't exist
  if !has_category(db, category_name)
    db.execute("INSERT INTO categories (name) VALUES (?)", [category_name])
  end
end

# method to add an idea to ideas database with 5 lists: category, description, time required (in minutes), done status, cost (0 to 5)
def add_idea(db, category, description, time_required, cost, done = "false")
  #checks if there's already a description matching it in the ideas table
  if !has_description(db, description)
    add_data_to_ideas = <<-SQL
      INSERT INTO ideas (category_id, description, time_required, cost, done_status)
        VALUES (?,?,?,?,?)
    SQL
    #convert the category to an id number
    c_id = convert_category_to_id(db, category)
    db.execute(add_data_to_ideas, [c_id, description, time_required, cost, done])
  end
end

# method to add a done event to the done database with 6 arguments: database, date, category, description, time taken, cost
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

# change done status from false to true
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

def basic_print(db, hash)
  hash.each do |item|
    puts "Category: " + convert_id_to_category(db, item['category_id']).capitalize
    puts "Description: #{item['description']}"
    puts "Time required: #{item['time_required']} minutes"
    puts "Cost: " + make_dollar_signs(item['cost'])
    puts "Done? #{item['done_status']}"
    puts "---\n"
  end
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
  basic_print(db, ideas)
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
  puts "\n"
end

# method to print out a list of ideas not yet done, or done, depending on the last argument
def print_done_or_not_done_list(db, done_or_not_done)
  #done_or_not_done should be "true" or "false"
  ideas = db.execute("SELECT * FROM ideas WHERE done_status=?", [done_or_not_done])
  basic_print(db, ideas)
end

# method to print out according to costs
def print_according_to_cost(db, cost_max)
  ideas = db.execute("SELECT * FROM ideas WHERE cost<=?", [cost_max])
  basic_print(db, ideas)
end

# method to print out according to time
def print_according_to_time(db, max_minutes)
  ideas = db.execute("SELECT * FROM ideas WHERE time_required<=?", [max_minutes])
  basic_print(db, ideas)
end

def print_ideas_by_category(db, category)
  c_id = convert_category_to_id(db, category)
  ideas = db.execute("SELECT * FROM ideas WHERE category_id = ?", [c_id])
  ideas.each do |ideas|
    puts "Category: " + convert_id_to_category(db, ideas['category_id']).capitalize
    puts "Description: #{ideas['description']}"
    puts "Time required: #{ideas['time_required']} minutes"
    puts "Cost: " + make_dollar_signs(ideas['cost'])
    puts "---"
  end
  puts "\n"
end

# methods that help printing

# method that finds the id # corresponding to category
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

#method that finds the actual category name from an id number
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

#method to print out the dollar signs to display cost
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

#method to return the number of available categories
def num_of_categories(db)
  categories = []
  db.execute("SELECT name FROM categories").each do |category|
    categories << category['name']
  end
  categories.size
end

####################
## USER INTERFACE ##
####################

# The following code allows the database to already have categories and a few examples set up
add_category(db, "shopping")
add_category(db, "food/drink")
add_category(db, "media")
add_category(db, "social")
add_category(db, "relaxation")
add_category(db, "pamper")
add_idea(db, "social", "talk to a friend", 5, 1, "false")
add_idea(db, "shopping", "buy a fur", 10, 3, "false")
add_idea(db, "shopping", "buy something real fancy", 50, 5, "true")
add_idea(db, "media", "watch a cat video", 5, 1, "true")
add_idea(db, "social", "sing a song badly really loud", 6, 1, "true")
add_idea(db, "relaxation", "walk in the park", 20, 1, "false")
add_idea(db, "food/drink", "eat ice cream", 15, 2, "false")

system("clear")

puts "Welcome to Treat Your Self (TYR Version 1.0)"
puts "\"Because you're worth it\" - Future You\n\n"

puts "Treat Your Self options:"
puts "1) Record how you treated yourself"
puts "2) See how you've treated yourself"
puts "3) Get a list of ideas about how to treat yourself"
puts "4) Add an idea about how to treat yourself"
puts "Type the number (or 'quit' to exit): "

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

  puts "Would you like to do something else? (y/n)"
  answer = gets.chomp.downcase

  if answer == "yes" || answer == "y"
    puts "Treat Your Self options:"
    puts "1) Record how you treated yourself"
    puts "2) See how you've treated yourself"
    puts "3) Get a list of ideas about how to treat yourself"
    puts "4) Add an idea about how to treat yourself"
    puts "Type the number (or 'quit' to exit)"
    option_input = gets.chomp
  else
    break
  end

end

puts "Your own well-being thanks you for treating yourself!"