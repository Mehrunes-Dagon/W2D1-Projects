require_relative "board"

module SlidingPiece
  STRAIGHTS = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1]
  ]
  DIAGONALS = [
    [-1, 1],
    [1, -1],
    [-1, -1],
    [1, 1]
  ]
  def moves(current_loc)
    pos_moves = []
    enemy_color = @board[current_loc].color === "White" ? "Black" : "White"

    direction.each do |dir|
      i = current_loc
      until !@board[i].is_a?(NullPiece) || @board[i].color == enemy_color
        i[0] += dir[0]
        i[1] += dir[1]
        break unless in_bounds(i)
        pos_moves << current_loc
      end
    end

    pos_moves
  end

end

class Piece

  attr_accessor :value, :color, :board, :position

  def initialize(value, color, board, position)
    @value = value
    @color = color
    @board = board
    @position = position
  end

end

class Bishop < Piece
  include SlidingPiece

  def initialize(value, color, board, position)
    super
  end

  def direction
    DIAGONALS
  end

end

class Rook < Piece
  include SlidingPiece

  def initialize(value, color, board, position)
    super
  end

  def direction
    STRAIGHTS
  end
end

class Queen < Piece
  include SlidingPiece

  def initialize(value, color, board, position)
    super
  end

  def direction
    STRAIGHTS + DIAGONALS
  end
end

class Knight < Piece

  def moves(current_loc)
    moves_list = [[-2, -1],[-2, 1],[-1, 2],[1, 2][2, 1],[2, -1],[1, -2],[-1, -2]]
    enemy_color = @board[current_loc].color === "White" ? "Black" : "White"

    pos_moves = moves_list.map do |move|
      move[0] += current_loc[0]
      move[1] += current_loc[1]
    end

    pos_moves.reject do |location|
      !@board.in_bounds(location) || !@board[location].color == enemy_color
    end
  end
end

class King < Piece

  def initialize(value, color, board, position)
    super
  end

  def moves(current_loc)
    moves_list = [[1, 0],[-1, 0],[0, 1],[0, -1][-1, 1],[1, -1],[-1, -1],[1, 1]]
    enemy_color = @board[current_loc].color === "White" ? "Black" : "White"

    pos_moves = moves_list.map do |move|
      move[0] += current_loc[0]
      move[1] += current_loc[1]
    end

    pos_moves.reject do |location|
      !@board.in_bounds(location) || !@board[location].color == enemy_color
    end
  end
end
#
class NullPiece < Piece
  include Singleton

  def initialize
    @value = " "
    @board = nil
    @color = nil
    @position = nil
  end
end
