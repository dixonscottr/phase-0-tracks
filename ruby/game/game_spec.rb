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
  expect(game.create_mystery_word("hello"))
  expect(game).to have_attributes guess_count: 5
end

it "makes the number of guesses equal to the number of letters in a phrase" do
  expect(game.create_mystery_word("hello world"))
  expect(game).to have_attributes guess_count: 10
end

end