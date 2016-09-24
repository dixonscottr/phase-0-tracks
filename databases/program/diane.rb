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

# method to add a category to categories database
# accepts 1 argument: name

def add_category(db, category_name)
  db.execute("INSERT INTO categories (name) VALUES (?)", [category_name])
end

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

def has_description(db, description, table)
  descriptions = []
  db.execute("SELECT description FROM #{table}").each do |idea|
    descriptions << idea['description'].downcase
  end
  descriptions.include?(description) ? true : false
end

# method to add an idea to ideas database
# accepts 5 arguments: category, description, time required (in minutes), done status, cost (0 to 5)
def add_idea(db, category, description, time_required, cost, done = "false")
  add_data_to_ideas = <<-SQL
    INSERT INTO ideas (category_id, description, time_required, cost, done_status)
      VALUES (?,?,?,?,?)
  SQL
  db.execute(add_data_to_ideas, [category, description, time_required, cost, done])
end

# method to add a done event to the done database
# accepts 6 arguments: database, date, category, description, time taken, cost

def log_event(db, date, category, description, time_taken, cost)
  log_event_to_done = <<-SQL
    INSERT INTO done (date_done, category_id, description, time_taken, cost)
      VALUES (?, ?, ?, ?, ?)
  SQL
  db.execute(log_event_to_done, [date, category, description, time_taken, cost])
end



def print_ideas(db)
  ideas = db.execute("SELECT * FROM ideas")
  ideas.each do |ideas|
    puts "Category: #{ideas['category_id']}"
    puts "Description: #{ideas['description']}"
    puts "Time required: #{ideas['time_required']} minutes"
    puts "Cost: " + ("$" * ideas['cost'].to_i)
    puts "Done? #{ideas['done_status']}"
    puts 
  end
end

def print_done_list(db)
  did = db.execute("SELECT * FROM done")
  did.each do |did|
    puts "Date: #{did['date_done']}"
    puts "Category: #{did['category_id']}"
    puts "Description: #{did['description']}"
    puts "Time taken: #{did['time_taken']} minutes"
    puts "Cost: " + ("$" * did['cost'].to_i)
    puts
  end
end

# method that finds the id # corresponding to category
# accepts a category as a name
# finds the category in the categories table
# outputs the id # of that category

def convert_category_to_id (db, category_name)
  categories = db.execute("SELECT id, name FROM categories")
  id_num = false
  categories.each do |category|
    if category['name'] == category_name
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



#################
## DRIVER CODE ##
#################

add_category(db, "shopping")
add_category(db, "food/drink")
add_category(db, "media")
add_category(db, "social")
add_category(db, "relaxation")
add_category(db, "pamper")

add_idea(db, 1, "talk to a shoe", 5, 0, "true")
add_idea(db, 2, "buy a pelt", 10, 5, "false")

log_event(db, '9/24/2016', 2, "talk to the queen", 15, 2)
log_event(db, '09/07/2016', 1, "buy a pelt", 10, 5)

print_ideas(db)
print_done_list(db)
p convert_category_to_id(db, "shopping")
p convert_category_to_id(db, "friends")
p convert_category_to_id(db, "media")

p has_category(db, "shopping")
p has_category(db, "friends")

p has_description(db, "buy a pelt", "ideas")
p has_description(db, "buy a coat", "ideas")
p has_description(db, "buy a coat", "done")
p has_description(db, "talk to the queen", "done")

# JOINS: 
# SELECT done.date_done, categories.name, done.description, done.time_taken, done.cost
# FROM done
# JOIN categories ON done.category_id = categories.id;

p convert_id_to_category(db, 2)
p convert_id_to_category(db, 3)