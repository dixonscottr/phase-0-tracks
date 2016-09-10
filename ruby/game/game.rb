#Pseudocode
#
# Ask for and store the word to guess
# Create a value that shows how the player has guessed, replacing the letters with underscores
# Create a value to show the number the player has guessed with the initial value being the number of letters in the word to guess
# Create a list to store the letters a player has guessed
# Create a value of game over and set it to false
# Create a value of game won and set it to false
#
# Until the game is over or the game is won
  # Print out the guessed word to the console
  # Print out how many guesses are left
  # IF the player has guessed a letter, print out which letters the player has guessed
  # Accept a letter as input to guess the word
    # IF the word includes the the letter
      # Check the index of the letter in the word
      # Replace the underscore(s) with the letter in the corresponding index in the guessed word
      # decrease guess count by 1
      # add the letter to the guessed letters list
    # IF the word doesn't include the letter
      # Decrease guess count by 1
      # Print a message telling the user that letter isn't in the word
    # IF the letter is in the list of letters already guessed
      # Print a message telling the user that the letter has already been guessed
  # IF the guessed word matches the original word
    # Change the game won value to true
  # IF the guess count equals 0
    # Change the game over value to true
# IF the game was won
  # Print a message to the console telling the user they won the game in a number of guesses
# IF the game wasn't won
  # Print a message to the console telling the user they lost and show them the word they couldn't guess

# Methods needed
#
# has_letter
  # input: letter, word
  # Checks if a letter is included in a word
  # output: boolean
# guess_letter
  # input: letter, word
    # Checks if a letter is in a word
      # IF the letter is in the word
        # Count how many letters are in the word
        # Until all letters are replaced
          # Check the index of the letter in the word
          # Replace the underscore with the letter(s) in the corresponding index in the guessed word
        # decrease guess count by 1
        # add the letter to the guessed letters list
      # IF the letter isn't in the word
        # Decrease guess count by 1
        # Print a message telling the user that letter isn't in the word
      # IF the letter is in the list of letters already guessed
        # Print a message telling the user that the letter has already been guessed
  # output: a guessed word (possibly with dashes)
# has_guessed
  # input: letter, list of letters
  # Check if a letter is in the list of letters already guessed
  # output: boolean


#print_update
  # input: guessed word, number of guesses left
  # Prints out to the console the current status of the guessed word along with the number of guesses left
  # output: nil

# create_mystery_word
  # input: word to guess
  # Determine number of letter in the word and store it as "num_letters"
  # Set the number of guesses to num_letters
  # Set the guessed_word to equal num_letters number of _'s
  # output: guessed word with underscores

# replace_blank
  # input: letter, mystery word, guessed word
    # IF the letter is only in the word once:
      # Check the index of the letter in the word
      # Update the guessed word, putting in the letter in the same index where it is in the word
    # IF the letter is in the word multiple times:
      # create a blank list of indexes
      # Change string to array and loop through it checking for the letter, store the indexes in the above list
      # Loop through the list of indexes and updated the guessed word with each index (|x| guessed_word[x] = letter)
  # output: guessed word

# Variables needed
# 
# mystery_word
# guessed_word
# guess_count
# game_won
# game_over
# guessed_letters


class MatchingGame
  
  attr_reader :game_won, :game_over, :guessed_letters
  attr_accessor :mystery_word, :guessed_word, :guess_count

  def initialize
    @game_won = false
    @game_over = false
    @guessed_letters = []
    @guessed_word = ''
  end

  def print_update
    puts "The word is #{@guessed_word} and you have #{@guess_count} guesses left"
  end

  def create_mystery_word(word)
    @mystery_word = word.downcase
    num_letters = @mystery_word.delete(" ").length
    @guess_count = num_letters
    @mystery_word.chars.each do |ltr|
      if ltr == " "
        @guessed_word << ltr
      else
        @guessed_word << "_"
      end
    end

    @guessed_word
  end

  def replace_blank(letter) #mystery_word, guessed_word
    if @mystery_word.count(letter) < 2
      letter_idx = @mystery_word.index(letter)
      # p @mystery_word
      # p letter_idx
      @guessed_word[letter_idx] = letter
    else
      # p letter
      letter_idxs = []
      @mystery_word.chars.each_with_index { |ltr, idx| ltr == letter ? letter_idxs << idx : nil }
      # p letter_idxs
      letter_idxs.each {|x| @guessed_word[x] = letter }
    end
    @guessed_word
  end

  def guess_letter(letter)
   if @guessed_letters.include?(letter)
     puts "You have already guessed #{letter}"
   elsif @mystery_word.include?(letter)
     @guess_count -= 1
     replace_blank(letter)
     guessed_letters << letter
     print_update
   else
     @guess_count -=1
     puts "Sorry. No '#{letter}' in the word"
     guessed_letters << letter
     print_update
  end
  
  if @guess_count == 0
    @game_over = true
  end

  if @guessed_word == @mystery_word
    @game_won = true
  end
  
    @guessed_word
  end

end

game = MatchingGame.new
puts game.game_won
puts game.game_over
puts game.guess_count
puts game.print_update
puts game.create_mystery_word("hello world")
puts game.guess_count
# puts game.print_update
# puts game.replace_blank("h")
# puts game.replace_blank("l")
# game.print_update

# game.guess_letter("h")
# p game
# game.guess_letter("x")
# p game
# game.guess_letter("l")
# p game









