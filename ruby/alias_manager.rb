#Swap first and last name
def swap_name(full_name)
  reversed_name = full_name.split(" ").reverse.join(" ")
end

# p swap_name("John Smith")
# puts swap_name("John Smith") == "Smith John"

#Go through the word and change all vowels (aeiou) to the next vowel

def vowel_shift(full_name)
  vowels = "aeiou"
  vowel_shifted_name = []
  full_name.downcase.chars do |letter|
    if vowels.include?(letter)
      vowel_idx = vowels.index(letter)
      if vowel_idx < 4
        vowel_shifted_name << vowels[vowel_idx + 1]
      else
        vowel_shifted_name << "a"
      end
    else
      vowel_shifted_name << letter
    end
  end
  vowel_shifted_name.join("")
end

# p vowel_shift("John Smith")
# puts vowel_shift("John Smith") == "Juhn Smoth"

#Go through the word and change all consonants (bcdfghjklmnpqrstvwxyz) to the next one
def consonant_shift(full_name)
  consonants = "bcdfghjklmnpqrstvwxyz"
  consonant_shifted_name = []
  full_name.downcase.chars do |letter|
    if consonants.include?(letter)
      c_idx = consonants.index(letter)
      if c_idx < (consonants.length - 1)
        consonant_shifted_name << consonants[c_idx + 1]
      else
        consonant_shifted_name << "b"
      end
    else
      consonant_shifted_name << letter
    end
  end
  consonant_shifted_name.join("")
end

# p consonant_shift("John Smith")
# puts consonant_shift("John Smith") == "Jojp Snivj"


#Capitalize the first letters of both names
def capitalize_name(full_name)
  new_name = full_name.split(" ")
  new_name = new_name.map {|name| name.capitalize}
  new_name.join(" ")
end

# p capitalize_name("john q smith")
# puts capitalize_name("john q smith") == "John Q Smith"

#Return the fake name

def fake_namer(real_name)
  fake_name = vowel_shift(real_name)
  fake_name = consonant_shift(fake_name)
  fake_name = swap_name(fake_name)
  fake_name = capitalize_name(fake_name)
end

puts "Welcome to the Pseudonym Maker!"
puts "Please enter your real name to get a spy name: (type 'quit' to exit)"
answer = gets.chomp
  while answer.downcase != "quit"
    spy_name = fake_namer(answer)
    puts "Your spy name is: #{spy_name}"
    puts "What is the next name to spy-ify?"
    answer = gets.chomp
  end

