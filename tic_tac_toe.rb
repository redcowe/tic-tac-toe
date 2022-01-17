require 'pry-byebug'
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
    0, 0, 0,
    0, 0, 0,
    0, 0, 0
  ]
  @already_explained = false
  @player_one = ''
  @player_two = ''
  @player_symbol = ''
  @winner = false
  @draw = false

  def self.explain_game
    puts 'Welcome to Tic Tac Toe!'
    sleep 1.4
    puts 'This version of Tic Tac Toe works just like the original Get three in a row an you win!'
    sleep 1.4
    puts 'The grid will use numbers, similar to a phone, so make sure you are certain about what you press!'
    sleep 1.4
    puts "Player one will be X's and Player two will be O's"
    sleep 1.4
    puts 'The board will be set up in a grid like so'
    puts '⌈ 1 | 2 | 3 ⌉'
    puts '⎥---+---+---⎥'
    puts '⎥ 4 | 5 | 6 ⎥'
    puts '⎥---+---+---⎥'
    puts '⌊ 7 | 8 | 9 ⌋'
    sleep 1.4
    puts 'Enter the respective position on the grid to place your symbol'
    @already_explained = true
  end

  def self.create_players
    if @number_of_players.zero?
      print 'Player one please enter your name: '
      @player_one = Player.new($stdin.gets.chomp)
      puts "Player one: #{@player_one.name}"
    else
      print 'Player two please enter your name: '
      @player_two = Player.new($stdin.gets.chomp)
      puts "Player two: #{@player_two.name}"
    end
    @number_of_players += 1
  end

  def self.display_board
    puts "⌈ #{@board[0]} | #{@board[1]} | #{@board[2]} ⌉"
    puts '⎥---+---+---⎥'
    puts "⎥ #{@board[3]} | #{@board[4]} | #{@board[5]} ⎥"
    puts '⎥---+---+---⎥'
    puts "⌊ #{@board[6]} | #{@board[7]} | #{@board[8]} ⌋"
    puts 'Enter a number: '
  end

  def self.set_player_turn
    if @number_of_turns.even?
      puts "#{@player_one.name}'s turn"
      @player_symbol = 'X'
      @number_of_turns += 1
    else
      puts "#{@player_two.name}'s turn"
      @player_symbol = 'O'
      @number_of_turns += 1
    end
    @player_symbol
  end

  def self.check_board?(value)
    if @board[value - 1] != 0
      puts 'That spot is already taken!'
      true
    else
      false
    end
  end

  def self.check_player_input(value)
    if @board[value - 1].is_a? Integer
      Game.set_player_turn
      if value.between?(1, 9)
        @board[value - 1] = @player_symbol
        Game.display_board
      else
        puts 'Please enter a number between one and 9.'
        Game.display_board
      end
    elsif @board[value - 1].is_a? String
      puts "That spot's already taken!"
      Game.display_board
    elsif !value.between?(1, 9)
      puts 'Please enter a number between one and 9.'
      Game.display_board
    end
  end

  def self.check_horizonal
    if @player_symbol == 'X'
      if @board[0] == 'X' && @board[1] == 'X' && @board[2] == 'X'
        puts "#{@player_one.name} wins!"
        @winner = true
      elsif @board[3] == 'X' && @board[4] == 'X' && @board[5] == 'X'
        puts "#{@player_one.name} wins!"
        @winner = true
      elsif @board[6] == 'X' && @board[7] == 'X' && @board[8] == 'X'
        puts "#{@player_one.name} wins!"
        @winner = true
      else
        false
      end
    elsif @player_symbol == 'O'
      if @board[0] == 'O' && @board[1] == 'O' && @board[2] == 'O'
        puts "#{@player_two.name} wins!"
        @winner = true
      elsif @board[3] == 'O' && @board[4] == 'O' && @board[5] == 'O'
        puts "#{@player_two.name} wins!"
        @winner = true
      elsif @board[6] == 'O' && @board[7] == 'O' && @board[8] == 'O'
        puts "#{@player_two.name} wins!"
        @winner = true
      else
        false
      end
    else
      false
    end
  end

  def self.check_vertical
    if @player_symbol == 'X'
      if @board[0] == 'X' && @board[3] == 'X' && @board[6] == 'X'
        puts "#{@player_one.name} wins!"
        @winner = true
      elsif @board[1] == 'X' && @board[4] == 'X' && @board[7] == 'X'
        puts "#{@player_one.name} wins!"
        @winner = true
      elsif @board[2] == 'X' && @board[5] == 'X' && @board[8] == 'X'
        puts "#{@player_one.name} wins!"
        @winner = true
      else
        false
      end
    elsif @player_symbol == 'O'
      if @board[0] == 'O' && @board[3] == 'O' && @board[6] == 'O'
        puts "#{@player_two.name} wins!"
        @winner = true
      elsif @board[1] == 'O' && @board[4] == 'O' && @board[7] == 'O'
        puts "#{@player_two.name} wins!"
        @winner = true
      elsif @board[2] == 'O' && @board[5] == 'O' && @board[8] == 'O'
        puts "#{@player_two.name} wins!"
        @winner = true
      else
        false
      end
    else
      false
    end
  end

  def self.check_diagonal
    if @player_symbol == 'X'
      if @board[0] == 'X' && @board[4] == 'X' && @board[8] == 'X'
        puts "#{@player_one.name} wins!"
        @winner = true
      elsif @board[2] == 'X' && @board[4] == 'X' && @board[6] == 'X'
        puts "#{@player_one.name} wins!"
        @winner = true
      end
    elsif @player_symbol == 'O'
      if @board[0] == 'O' && @board[4] == 'O' && @board[8] == 'O'
        puts "#{@player_two.name} wins!"
        @winner = true
      elsif @board[2] == 'O' && @board[4] == 'O' && @board[6] == 'O'
        puts "#{@player_two.name} wins!"
        @winner = true
      end
    end
  end

  def self.check_for_winner
    Game.check_horizonal
    Game.check_vertical
    Game.check_diagonal
  end
  # Work on this later
  def self.check_draw
    if @winner == false && @board.all? == String
      puts 'Draw!'
      @draw = true
    end
  end

  def self.play_game
    until @already_explained
      Game.explain_game
    end
    until @number_of_players == 2
      Game.create_players
    end
    if @number_of_players == 2 && @winner == false || @number_of_players == 2 && @draw == false
      Game.display_board
      until @draw || @winner
        @player_choice = $stdin.gets.chomp.to_i
        Game.check_player_input(@player_choice)
        Game.check_for_winner
      end
    end
  end
end

Game.play_game
