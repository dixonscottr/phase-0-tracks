# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

puts "iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”
puts "hElLo WoRlD".swapcase == "HeLlO wOrLd"

puts "zom".insert(2, "o")
# => “zoom”
puts "helo".insert(3, "l") == "hello"

puts "enhance".ljust(11).rjust(15)
puts "enhance".concat("    ").prepend("    ")
# => "    enhance    "
puts "to the right".rjust(30) == "                  to the right"
puts "to the left".ljust(30, "a") == "to the leftaaaaaaaaaaaaaaaaaaa"

puts "Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"
puts "hello world".upcase == "HELLO WORLD"

puts "the usual".concat(" suspects")
puts "the usual" << " suspects"
#=> "the usual suspects"
puts "hello".concat(" world") == "hello world"

puts " suspects".prepend("the usual")
# => "the usual suspects"
puts " world".prepend("hello") == "hello world"

puts "The case of the disappearing last letter".chop
# => "The case of the disappearing last lette"
puts "Goodbye exclamation point!".chop == "Goodbye exclamation point"


puts "The mystery of the missing first letter".reverse.chop.reverse
puts "The mystery of the missing first letter".slice(1..-1)
# => "he mystery of the missing first letter"
puts "hello world".slice!(1..-1) == "ello world"

puts "Elementary,    my   dear        Watson!".squeeze(" ")
# => "Elementary, my dear Watson!"
puts "wooden books are the yellowest".squeeze == "woden boks are the yelowest"

puts "z".ord
puts "z".sum
# => 122 
# (What is the significance of the number 122 in relation to the character z?)
puts "abc".sum == 294


puts "How many times does the letter 'a' appear in this string?".count("a")
# => 4
puts "Goats, Badgers, Bees and things".count(",") == 2