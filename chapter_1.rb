### Guess a Number Game ###
# Inspired by the book "Head First Ruby: A Brain Friendly Guide"
# Written without looking at their code examples.

### Deliverables ###
# Prompt the Player to enter their name
# Generate a Random Number from 1 to 100
# Keep track of how many guesses the player has made
# Before each guess, let them know many guesses (out of 10) they have left
# Prompt the player to make a guess as to what the target number is
# If the player's guess is less than the target number say "Oops. Your guess was LOW."
# If the player's guess is greater than the target number, say "Oops, Your guess was HIGH."
# If the player's guess is equal to the target number, tell them "Good job, [name]!
# => You guessed my number in [number of guesses] guesses"
#If the player runs out of turns without guessing correctly, say, "Sorry, You didn't get my number. My number was [target]."
#Keep allowing the player to guess until they get it right or run out of turns.


class Game

  include Comparable

  attr_accessor :name, :random_number, :turn_count, :guesses

  def initialize
    @name = name
    @random_number = rand(1..100)
    @turn_count = 10
    @guesses = 0

    new_game
  end

  def new_game
    puts "Please enter your name..."
    @name = gets.chomp
    puts "Welcome to the game, #{name}!"

    while turn_count > 0
      puts "Please guess a number from 1 to 100..."
      puts "You have #{turn_count} guesses remaining."
      guess = gets.chomp.to_i
      self.guesses += 1
      if guess == random_number
        puts "Good job, #{name}, you guessed my number! You guessed my number in #{guesses} guesses."
        play_again?
      elsif guess < random_number
        puts "Oops. Your guess was LOW."
        self.turn_count -= 1
      elsif guess > random_number
      puts "Oops. Your guess was HIGH."
        self.turn_count -= 1
      end
  end
  puts "Sorry. You didn't get my number. My number was #{random_number}."
  play_again?
end

  def play_again?
    puts "Would you like to play again?"
    prompt = gets.chomp.downcase
      if prompt == "y"
        Game.new
      else
        puts "Thanks for playing!"
        exit
      end
  end

end

Game.new
