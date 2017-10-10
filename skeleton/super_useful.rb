class CoffeeError < StandardError
end

# PHASE 2
def convert_to_int(str)
  begin
  Integer(str)
  rescue ArgumentError => e
  puts "Not an integer"
  # retry unless Integer(str)
  nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  # begin
    raise CoffeeError.new("I dig coffee") if maybe_fruit == "coffee"
    unless FRUITS.include?(maybe_fruit)
      raise StandardError.new("Not right fruit")
    end
      puts "OMG, thanks so much for the #{maybe_fruit}!"
end

def feed_me_a_fruit
  begin
    puts "Hello, I am a friendly monster. :)"
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  # rescue StandardError => e
    # puts "Try again"
  rescue CoffeeError => e2
    puts "coffee is okay. yo can try again"
    retry
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
