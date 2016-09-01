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

# p to_lowercase("John Smith")
# puts to_lowercase("John Smith") == "john smith"

#Go through the word and change all vowels (aeiou) to the next vowel

def vowel_shift(full_name)
  vowels = "aeiou"
  vowel_shifted_name = []
  full_name.chars do |letter|
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
  full_name.chars do |letter|
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

p consonant_shift("John Smith")
puts consonant_shift("John Smith") == "Jojp Snivj"


#Capitalize the first letters of both names

#Return the fake name