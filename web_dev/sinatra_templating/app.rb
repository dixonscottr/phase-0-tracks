# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

# add static resources

get '/students/search_by_age' do
  erb :search_by_age
end

post '/students/search_by_age' do
  age = params['age'].to_i
  student_age = db.execute("SELECT * FROM students WHERE age=?", [age])
  student_list = ''
  student_age.each do |student|
    student_list << "Name: #{student['name']}<br />"
    student_list << "Age: #{student['age']}<br />"
    student_list << "Campus: #{student['campus']}<br />"
  end

  <<-HTML
  <h2>Search results for #{age}-year-old students:</h2>
  #{student_list}
  HTML

end