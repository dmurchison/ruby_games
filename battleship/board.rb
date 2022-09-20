
class Board
  
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n){Array.new(n,:N)}
    @size = n * n
  end

  def [](array)
    @grid[array[0]][array[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def num_ships
    @grid.flatten.count(:S)
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      p "you sunk my battleship!"
      return true
    else
      self[pos] = :X
      return false
    end
  end

  def place_random_ships
    num = @size * 0.25
    while self.num_ships < num
      row = rand(0...@grid.length)
      col = rand(0...@grid[0].length)
      @grid[row][col] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |el|
        el == :S ? :N : el
      end
    end
  end

  def self.print_grid(arr)
    arr.each do |row|
      puts row.join(" ")
    end
  end
  
  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

end

