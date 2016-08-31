def block_test
puts "I'm about to run a block test."
yield ("blockblock")
puts "I finished a block test."
end

block_test { |block_parameter| puts "I'm testing a #{block_parameter}"}

colors = ["red", "blue", "orange", "yellow"]

countries = {
  Usa: "Washington",
  Poland: "Warsaw",
  Russia: "Moscow",
  China: "Beijing"
}

colors.each do |color|
  puts color
  puts "My favorite color is #{color}."
end

colors.map! do |color|
  puts color
  color.reverse
end
puts "My favorite reversed colors are #{colors}."

countries.each do |country, capital|
  puts country
  puts capital
  puts "The capital of #{country} is #{capital}."
end
    puts countries

#HASH

integers = {
  1 => "one",
  2 => "two",
  3 => "three"
}

integers.delete_if {|integer, word| integer < 2}
 puts integers

 integers = {
  1 => "one",
  2 => "two",
  3 => "three"
}

integers.keep_if {|integer, word| word == "one"}
puts integers

integers = {
  1 => "one",
  2 => "two",
  3 => "three"
}
 new_integers= integers.reject {|integer, word| integer < 2}
 puts new_integers

integers = {
  1 => "one",
  2 => "two",
  3 => "three"
}
 integers.each do |k, v|
  puts k 
  break if v == "two"
 end


#ARRAY

letters = [ "a", "b", "c", "d", "e"]

letters.delete_if {|letter| letter == letters[4]} 
puts letters

letters = [ "a", "b", "c", "d", "e"]

letters.keep_if {|letter| letter == letters[2]}
puts "Letter #{letters} is saved!"

letters = [ "a", "b", "c", "d", "e"]

new_letters = []
new_letters = letters.reject {|letter| letter == "b"}
puts new_letters

letters = [ "a", "b", "c", "d", "e"]

new_letters = []
new_letters = letters.take_while {|letter| letter  == "a"}
puts new_letters
