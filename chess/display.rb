require_relative "cursor"
require_relative "piece"
require_relative "board"
require "colorize"

PIECES = {
  Ki: "King",
  Qn: "Queen",
  Bs: "Bishop",
  Kn: "Knight",
  Rk: "Rook",
  Pn: "Pawn",
  Ni: "Null"
}
class Display
  attr_accessor :board, :cursor

  def initialize(board)

    @board = board
    @cursor = Cursor.new([0,0], board)

  end

  def render_board
    @board.grid.each_with_index do |row, i|
      puts "------------------------------------------------\n"
      row.each_with_index do |square, j|
        if @cursor.cursor_pos == [i, j]
          print "| @@ |"
        elsif row[j].nil?
          print "|    |"
        else
          print "| #{row[j].value[0..1]} |"
        end
      end
      puts "\n"
    end
    puts "------------------------------------------------\n"

  end

  def render_square
    @cursor_pos.color
  end



end
