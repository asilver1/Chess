require_relative "piece.rb"
require_relative "cursor.rb"
class Board
  attr_accessor :cursor, :grid

  def initialize
    @grid=Array.new(8) {Array.new(8)}
    @grid.each_with_index do |row, i|
      row.each_with_index do |sqr, j|
        if i>=6 || i<=1
          @grid[i][j] = Piece.new([i,j], "q")
        else
          @grid[i][j] = NullPiece.new([i,j])
        end
      end
    end
  end

  

  def []=(position,value)
    x = position[0]
    y = position[1]
    @grid[x][y] = value
  end

  def [](position)
    x = position[0]
    y = position[1]
    @grid[x][y]
  end

  def move_piece(start_pos, end_pos)
    x_s = start_pos[0]
    y_s = start_pos[1]
    x_e=end_pos[0]
    y_e=end_pos[1]
    raise "error" if start_pos==nil
    raise "no piece" if @grid[x_s][y_s  ].is_a?(NullPiece)
    # raise "error" if !valid_move(start_pos, end_pos)
    @grid[x_s][y_s].position=end_pos
    @grid[x_e][y_e].position =start_pos
    update_grid(start_pos,end_pos)
  end

  def update_grid(start_pos,end_pos)
    self[start_pos], self[end_pos]  = self[end_pos], self[start_pos]
  end

  def in_bounds(cursor_pos)
    cursor_pos
    if cursor_pos[0]<@grid.length && cursor_pos[0]>=0
      if cursor_pos[1]<@grid[0].length && cursor_pos[0]>=0
        return true
      end
    end
    false
  end

  def valid_move?(piece,start_pos,end_pos)

  end
end

board=Board.new()
# p board.grid[1][1]
# p board.grid[2][1]
# board.move_piece([1,1],[2,1])
# p board.grid[2][1]
# p board.grid[1][1]
