require_relative 'board.rb'

class HumanPlayer

  attr_reader :mark

  def initialize(mark_value)
      @mark = mark_value
  end

  # Get the users position and mark
  def get_position
    begin
      puts "#{@mark}, Please enter a position in the form of 'num1 num2'"
      input = gets.chomp.split(" ").map(&:to_i)
      if input.length != 2
        raise StandardError("This is incorrect format")
      else
        input
      end
    rescue
      puts "Please try again"
      retry
    end
  end

end
