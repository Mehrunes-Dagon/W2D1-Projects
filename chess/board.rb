require_relative "piece"

class Board
  attr_accessor :grid

  def make_starting_grid
    Array.new(8) {Array.new(8)}
  end

  def initialize
    @grid = self.make_starting_grid
  end

  def fill_board
    pos = [0,0]

    i = 0
    while i < 8
      j = 0
      while j < 8
        pos = [i ,j]
        self[pos] = NullPiece.instance
        j += 1
      end
      i += 1
    end
    self[pos] = Piece.new("Pawn", "White")
  end

  def move_piece(start_pos, end_pos)
    temp = self[end_pos]
    raise PlacementError if self[start_pos].is_a?(NullPiece)
    raise PlacementError unless self[end_pos].is_a?(NullPiece)
    self[end_pos] = self[start_pos]
    self[start_pos] = temp
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

  def in_bounds(pos)
    (0..7).include?(pos[0]) && (0..7).include?(pos[1])
  end

end

#TODO: Define placement error
