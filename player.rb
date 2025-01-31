require_relative 'battleship'

class Player
  def get_move
    puts "Enter a position in the form of 'Row Column'"
    input = gets.chomp.split(' ').map(&:to_i)
  end
end

puts "Enter a size for the game: "
battleship = Battleship.new(gets.chomp.to_i)
battleship.start_game

until battleship.game_over? do
  puts "-------------------------"
  battleship.turn
end
