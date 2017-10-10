class Piece

    def initialize(value, color)
      @value = value
      @color = color
    end


end

class NullPiece < Piece

  def initialize
    @value = nil
  end
end
