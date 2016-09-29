# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# write a GET route that displays an address

get '/contact' do
  <<-HTML
  <h2>Contact me:</h2>
  <p>123 E. 80th St</p>
  <p>New York, NY 10021</p>
  <p><strong>BU</strong>tterfield 8-5050</p>
  HTML
end

# write a GET route that takes a person's name as a query parameter

get '/good_job' do
  name = params[:name]
  if name
    <<-HTML
    <h2>Good job, #{name}</h2>
    HTML
  else
    <<-HTML
    <h2>Good job...you</h2>
    HTML
  end
end

# write a GET route that takes 2 route parameters (numbers) and adds them

get '/:num_one/and/:num_two' do
  num_one = params[:num_one].to_i
  num_two = params[:num_two].to_i
  
  sum = num_one + num_two
  product = num_one * num_two
  difference = (num_one - num_two)
  dividend = num_one.to_f / num_two.to_f

  <<-HTML
  <h1>Arithmatic</h1>

  <h2>Addition:</h2>
  <p>#{num_one} plus #{num_two} equals #{sum}<p>

  <h2>Subtraction:</h2>
  <p>#{num_one} minus #{num_two} equals #{sum}<p>

  <h2>Muliplication:</h2>
  <p>#{num_one} times #{num_two} equals #{product}<p>

  <h2>Division:</h2>
  <p>#{num_one} divided #{num_two} equals #{dividend}<p>
  HTML
end