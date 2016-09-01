#Swap first and last name
def swap_name(full_name)
  reversed_name = full_name.split(" ").reverse.join(" ")
end

# p swap_name("John Smith")
# puts swap_name("John Smith") == "Smith John"

#Change all letters to lowercase
def to_lowercase(full_name)
  lowercase_name = full_name.downcase
end

p to_lowercase("John Smith")
puts to_lowercase("John Smith") == "john smith"

#Go through the word and change all vowels (aeiou) to the next vowel

#Go through the word and change all consonants (bcdfghjklmnpqrstvwxyz) to the next one

#Capitalize the first letters of both names

#Return the fake name