require_relative "cursor.rb"
require "colorize"
require_relative "board.rb"
require "byebug"

class Display
  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], @board)
  end

  def get_input
    begin
      render
      input = true
      while input
        input = @cursor.get_input
        render
      end
    rescue
      retry
    end
  end


  def render
    @board.grid.each_with_index do |row,row_idx|
      row.each_with_index do |el,col_idx|
        if @cursor.selected_pos == [row_idx,col_idx] && !@cursor.selected_pos.nil?
          print el.figure_type.colorize(:green)
        else
          print el.figure_type
        end
      end
      puts ""
    end
  end
end

d = Display.new
d.get_input
