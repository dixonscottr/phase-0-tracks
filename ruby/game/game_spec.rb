require_relative "game"

describe MatchingGame do
  let(:game) {MatchingGame.new}

  it "replaces an underscore with the correct letter" do
    game.mystery_word = "hello"
    game.guessed_word = "_____"
    expect(game.replace_blank("h")).to eq("h____")
  end

  it "replaces two or more underscores with the correct letters" do
    game.mystery_word = "hello"
    game.guessed_word = "_____"
    expect(game.replace_blank("l")).to eq("__ll_")
  end

  it "replaces all letters of a word with underscores" do
    expect(game.create_mystery_word("hello")).to eq("_____")
  end

  it "replaces only the letters in a phrase with underscores" do
    expect(game.create_mystery_word("hello world")).to eq("_____ _____")
    end

  it "makes the number of guesses equal to the number of letters in a word" do
    game.create_mystery_word("hello")
    expect(game).to have_attributes guesses_left: 10
  end

  it "makes the number of guesses equal to the number of letters in a phrase" do
    game.create_mystery_word("hello world")
    expect(game).to have_attributes guesses_left: 15
  end

  it "guesses a letter and updates the guessed word if correct" do
    game.create_mystery_word("hello")
    expect(game.guess_letter("h")).to eq ("h____")
  end

  it "guesses a letter correctly and decreases the guess count by 1" do
    game.create_mystery_word("hello")
    game.guess_letter("h")
    expect(game).to have_attributes guesses_left: 9
  end

  it "guesses a letter incorrectly and decreases the guess count by 1" do
    game.create_mystery_word("hello")
    game.guess_letter("x")
    expect(game).to have_attributes guesses_left: 9
  end

  it "guesses a previously guessed letter and keeps the same guess count" do
    game.create_mystery_word("hello")
    game.guess_letter("h")
    game.guess_letter("h")
    expect(game).to have_attributes guesses_left: 9
  end

  it "changes the game over status to true if 0 guesses are left" do
    game.create_mystery_word("hello") #10 guesses left
    game.guess_letter("x")
    game.guess_letter("a")
    game.guess_letter("h")
    game.guess_letter("l")
    game.guess_letter("n")
    game.guess_letter("p")
    game.guess_letter("o")
    game.guess_letter("z")
    game.guess_letter("w")
    game.guess_letter("d")
    expect(game).to have_attributes game_over: true
  end

  it "changes the game won status to true if guessed and mystery word are the same" do
    game.create_mystery_word("hello")
    game.guess_letter("h")
    game.guess_letter("e")
    game.guess_letter("l")
    game.guess_letter("l")
    game.guess_letter("o")
    expect(game).to have_attributes game_won: true
  end

  it "only accepts one letter at a time" do
    game.create_mystery_word("hello")
    game.guess_letter("hello")
    expect(game).to have_attributes guesses_left: 10
  end

end