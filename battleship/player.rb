class Player
  def get_move
    puts "Enter coordinates for your attack (e.g., 'Row', 'Col'): "
    gets.chomp.split.map(&:to_i)
  end
end
