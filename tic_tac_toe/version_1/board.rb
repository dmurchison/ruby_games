class Board
  # Initialize the grid
  def initialize
    @grid = Array.new(3){ Array.new(3,'_') }
  end

  # Check if a pos is valid
  def valid?(pos)
    !@grid[pos[0]][pos[1]].nil?
  end

  # Check if the pos is empty?
  def empty?(pos)
    @grid[pos[0]][pos[1]] == '_'
  end

  # If the pos is valid and empty, place the user's mark there
  def place_mark(pos, mark)
    if self.empty?(pos) && self.valid?(pos)
      @grid[pos[0]][pos[1]] = mark
    else
      raise StandardError("invalid mark")
    end
  end

  # Print the grid so the user can see that they made the correct move
  def print
    p @grid[0]
    p @grid[1]
    p @grid[2]
  end

  # Check if the user has won with any rows
  def win_row(mark)
    @grid.any? { |row| row.all? { |el| mark == el } }
  end

  # Check if the user has won with any cols
  def win_col(mark)
    arr = @grid.transpose
    arr.any? { |col| col.all? { |el| mark == el } }
  end

  # Check if the user has won with any diagonals
  def win_diagonal(mark)
    left_diag = []
    right_diag = []
    i = 0
    j = -1
    while i < @grid.length
      left_diag << @grid[i][i]
      right_diag << @grid[i][j]
      i += 1
      j -= 1
    end
    if left_diag.all?{|el|el == mark} || right_diag.all?{|el|el == mark}
      return true
    else
      false
    end
  end

  # Check all three possible winning scenerios at once
  def win?(mark)
    if self.win_row(mark) || self.win_col(mark) || self.win_diagonal(mark)
      return true
    else
      false
    end
  end

  # Check if there are any empty positions left
  def empty_positions?
    @grid.any? { |row| row.any? { |el| el == '_' } }
  end
end
