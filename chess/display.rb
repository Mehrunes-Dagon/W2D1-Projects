require_relative "cursor"

class Display

  def initialize(cursor)
    @cursor = Cursor.new([0,0], board)
  end

end
