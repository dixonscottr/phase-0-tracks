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

end