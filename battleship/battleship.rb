require_relative 'board'
require_relative 'player'

class Battleship
  attr_reader :board, :player

  def initialize(input_num)
    @player = Player.new
    @board = Board.new(input_num)
    @remaining_misses = 10
  end

  def start_game
    @board.place_random_ships
    p @board.num_ships
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      p 'YOU LOSE!'
      true
    else
      false
    end
  end

  def win?
    if @board.num_ships.zero?
      p 'YOU WIN!'
      true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      return true
    end

    false
  end

  def turn
    move = @player.get_move
    @remaining_misses -= 1 unless @board.attack(move)
    @board.print
    puts "Remaining Misses #{@remaining_misses}"
    puts "Remaining Ships #{@board.num_ships}"
  end
end
