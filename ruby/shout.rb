# module Shout
#   def self.yell_angrily(words)
#     words + "!!!" + " :("
#   end

#   def self.yell_happily(words)
#     " (＠＾－＾)   " + words + "   (＾－＾@)"
#   end

# end

# p Shout.yell_angrily("I am so mad!")
# p Shout.yell_happily("I am so happy!")

module Shout

  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yell_happily(words)
    " (＠＾－＾)   " + words + "   (＾－＾@)"
  end

end

class Librarian
  include Shout
end

class TrainConductor
  include Shout
end

lori_beth = Librarian.new
puts lori_beth.yell_angrily("Be Quiet! This is a library!")
puts lori_beth.yell_happily("Children are reading quietly!")

teri = TrainConductor.new
puts teri.yell_angrily("Stand back and let the doors close!")
puts teri.yell_happily("Thank you for riding with the MTA!")