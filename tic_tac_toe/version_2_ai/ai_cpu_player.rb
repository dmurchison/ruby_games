require_relative 'board'

class ComputerPlayer
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def get_move
    puts "Computer's turn"
    sleep(1)
    @board.display_board
    puts "Computer is thinking..."
    sleep(1)
    @board.available_spaces.sample
  end

  def make_move(move)
    @board.update_board(move, "O")
  end

  def game_over?
    @board.game_over?
  end
end

# Adding a computer player to tic tac toe game in Ruby
