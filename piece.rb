class Piece
  attr_accessor :position, :figure_type
  def initialize(position, figure_type)
    @position = position
    @figure_type = figure_type
  end

  def position=(pos)
    @position = pos
  end
end

class NullPiece < Piece
  attr_accessor :position
  def initialize(position)
    @position = position
    super(@position, nil)
  end
end

class Queen < Piece
  attr_accessor :position
  def initialize
    @position = [0, 3]
    super(@position, "q")
  end
end

class King < Piece

end
