#scott and collin

#write encrimt method for every letter of the string.
#find the length of the word.
#loop through every letter in the string and increment by open_session.
#return final value.

#ask the user wether they want to encrypt or decrypt.
#ask the user for a password to either decrypt or encrypt.
#decrypt/encrypt password and return the final result to the screen.

def encrypt(string)
  counter = 0
  while counter < string.length
    if string[counter] == 'z'
      string[counter] = 'a'
    else
      string[counter] = string[counter].next
    end
      counter = counter + 1
  end
    return string
end

#write dexrypt method thar reverses the letter of the string in the alphabet.
#create a variable called alphabet that stores the alphabet
#create a counter
#create a while loop that goes through each letter of the string
  #find the index in alphabet and subtract 1 from that index
  #replace letter with one before
#return final value

def decrypt(string)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  counter = 0
  while counter < string.length
    string[counter] = alphabet[(alphabet.index(string[counter]) -1)]
    counter = counter + 1
  end
  return string
end

puts 'Would you like to encrypt or decrypt?'
secret_agent = gets.chomp

if secret_agent == 'encrypt'
  puts 'please give me the password to encrypt.'
  password_e = gets.chomp
  result = encrypt(password_e)
  puts "Your result is #{result}"
elsif secret_agent == 'decrypt'
  puts "please give me the password to decrypt."
  password_d = gets.chomp
  result = decrypt(password_d)
  puts "Your result is #{result}"
else
  puts 'Well then why are you here?'
end



#decrypt(encrypt("swordfish"))
=begin
  This bit of code worked because of the rule of thumb when it comes to order of opperations. First to happen is the encrypt method is called on swordfish which it then returns "txpsegjti". Now that the encrypt method is done, the decrypt method only has the string "txpsegjti" as an argument it then runs the method like normal on the string and in doing so returns 'swordfish'.
=end