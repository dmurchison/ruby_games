
require_relative "battleship"

puts "Enter a size for the game: "
battleship = Battleship.new(gets.chomp.to_i)
battleship.start_game

until battleship.game_over? do
  puts "-------------------------"
  battleship.turn
end
