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
    @turn = false
  end

  def set_turn
    @turn = true
  end
end

# Responible for creating and managing the game
module Game
  @number_of_players = 0
  @number_of_turns = 0
  @board = [
    [0], [0], [0],
    [0], [0], [0],
    [0], [0], [0]
  ]
  @already_explained = false
  @player_one = ''
  @player_two = ''

  def self.explain_game
    puts 'Welcome to Tic Tac Toe!'
    sleep 1.4
    puts 'This version of Tic Tac Toe works just like the original Get three in a row an you win!'
    sleep 1.4
    puts 'The grid will use numbers, similar to a phone, so make sure you are certain about what you press!'
    sleep 1.4
    puts "Player one will be X's and Player two will be O's"
    @already_explained = true
  end

  def self.create_players
    if @number_of_players.zero?
      print 'Player one please enter your name: '
      @player_one = Player.new($stdin.gets.chomp)
      puts "Player one: #{player_one.name}"
    else
      print 'Player two please enter your name: '
      @player_two = Player.new($stdin.gets.chomp)
      puts "Player two: #{player_two.name}"
    end
    @number_of_players += 1
  end

  def self.play_game
    @already_explained == true ? Game.create_players : Game.explain_game
    if @number_of_players == 2
      puts '⌈ 1 | 2 | 3 ⌉'
      puts '⎥---+---+---⎥'
      puts '⎥ 4 | 5 | 6 ⎥'
      puts '⎥---+---+---⎥'
      puts '⌊ 7 | 8 | 9 ⌋'
      puts 'Please input a number: '
      player_choice = $stdin.gets.chomp


    end
  end
end


#Game.play_game until winner
