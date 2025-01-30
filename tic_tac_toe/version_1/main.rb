require_relative 'game'

puts "Welcome to Tic Tac Toe!"
puts "Player 1, please enter your mark (e.g., X or O):"
player_1_mark = gets.chomp
puts "Player 2, please enter your mark (e.g., X or O):"
player_2_mark = gets.chomp

game = Game.new(player_1_mark, player_2_mark)
puts game.play
