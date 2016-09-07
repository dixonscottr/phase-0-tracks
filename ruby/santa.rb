class Santa

  def initialize
    puts "Initializing Santa instance..."
  end
  
  def speak
    puts "Ho ho ho! Happy Holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}"
  end

end

st_nick = Santa.new
st_nick.speak
st_nick.eat_milk_and_cookies("gingersnap")