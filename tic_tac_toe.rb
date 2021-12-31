#########################

# Two players go back and forth on per turn
# Create a player class that creates each player
# Player one will be in the 

# Winning is only possible after a minimum of three turns

# There is a maximum of 9 turns that can be played

# 
#
#
#
#

#########################

winner = false

# Creates a player object
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

# Creates game board
class Board
  def self.create_board
    board = [
      [0], [0], [0],
      [0], [0], [0],
      [0], [0], [0]
    ]
  end
end

# Responible for creating and managing the game
module Game
  @number_of_players = 0
  @number_of_turns = 0

  def self.play_game
    # create players
    if @number_of_players.zero?
      print 'Player one please enter your name: '
      player_one = Player.new(gets.chomp)
      puts "Player one: #{player_one.name}"
      @number_of_players += 1
    else
      print 'Player two please enter your name: '
      player_two = Player.new(gets.chomp)
      puts "Player two: #{player_two.name}"
      @number_of_players += 1
    end

    # create the board
  end
end

Game.play_game until winner
