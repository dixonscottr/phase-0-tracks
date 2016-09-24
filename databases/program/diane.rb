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
    done_status BOOLEAN,
    COST INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories(id)
  )
SQL
db.execute(create_ideas_table)

# #create done events with 5 lists: date, category, description, time taken, cost

# create_done_table = <<-SQL
#   CREATE TABLE IF NOT EXISTS done(
#     id INTEGER PRIMARY KEY,
#     category_id INTEGER,
#     description VARCHAR(255),
#     time_taken INTEGER,
#     COST INTEGER,
#     FOREIGN KEY category_id REFERENCES categories(id)
#   )
# SQL
# db.execute(create_done_table)
