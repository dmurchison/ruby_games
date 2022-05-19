
require_relative "board.rb"
require_relative "human_player.rb"

class Game

  def initialize(player_1_mark, player_2_mark)
    @board = Board.new
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark)
    @current_player = @player_1
  end
    
  def switch_turn # Switch turns after a player has made a move
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def play # Game loop
    while @board.empty_positions?
      begin
        @board.print
        pos = @current_player.get_position
        @board.place_mark(pos, @current_player.mark)
      rescue
        puts "Please try this entry again!"
        retry
      end
      if @board.win?(@current_player.mark)
        @board.print
        return "Congratulations #{@current_player.mark}, you win!"
      else
        self.switch_turn
      end
    end
    return "This was a tie... Try again!"
  end

end
