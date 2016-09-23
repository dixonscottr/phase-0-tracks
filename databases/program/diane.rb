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