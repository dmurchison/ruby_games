class Board
  attr_reader :size

  def initialize(input_num)
    @grid = Array.new(input_num) { Array.new(input_num, '_') }
    @size = input_num * input_num
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
      p 'You sunk my battleship!'
      true
    else
      self[pos] = :X
      p 'MISS!!!!'
      false
    end
  end

  def place_random_ships
    num = @size * 0.25
    while num_ships < num
      row = rand(0...@grid.length)
      col = rand(0...@grid[0].length)
      @grid[row][col] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |el|
        el == :S ? '_' : el
      end
    end
  end

  def self.print_grid(arr)
    arr.each do |row|
      puts row.join(' ')
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
