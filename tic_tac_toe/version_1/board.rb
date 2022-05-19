
class Board

  def initialize # Initialize the grid
    @grid = Array.new(3){ Array.new(3,'_') }
  end

  def valid?(pos) # Check if a pos is valid
    !@grid[pos[0]][pos[1]].nil?
  end
  
  def empty?(pos) # Check if the pos is empty?
    @grid[pos[0]][pos[1]] == '_'
  end

  def place_mark(pos, mark) # If the pos is valid and empty, place the user's mark there
    if self.empty?(pos) && self.valid?(pos)
      @grid[pos[0]][pos[1]] = mark
    else
      raise StandardError("invalid mark")
    end
  end

  def print # Print the grid so the user can see that they made the correct move
    p @grid[0]
    p @grid[1]
    p @grid[2]
  end

  def win_row(mark) # Check if the user has won with any rows
    @grid.any? { |row| row.all? { |el| mark == el } }
  end

  def win_col(mark) # Check if the user has won with any cols
    arr = @grid.transpose
    arr.any? { |col| col.all? { |el| mark == el } }
  end

  def win_diagonal(mark) # Check if the user has won with any diagonals
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

  def win?(mark) # Check all three possible winning scenerios at once
    if self.win_row(mark) || self.win_col(mark) || self.win_diagonal(mark)
      return true
    else
      false
    end
  end

  def empty_positions? # Check if there are any empty positions left
    @grid.any? { |row| row.any? { |el| el == '_' } }
  end

end
