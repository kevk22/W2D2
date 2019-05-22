require_relative "Board"
require "colorize"
require_relative "Cursor"
require "byebug"

class Display
  attr_reader :cursor
    def initialize(board)
      
      @cursor = Cursor.new([0,0], board)
      @board = board
    end

    def render
      
      while true 
        @cursor.get_input
        
        puts " ---------------------- "
        @board.grid.each_with_index do |sub_array, i|
          sub_array.each_with_index do |ele, j|
          
          pos = [i,j]
            if pos == @cursor.cursor_pos
              print @board.grid[i][j].to_s.colorize(:blue)
            else
              print @board.grid[i][j]
            end
          end
          puts
          puts
        end
    end
      

    end
end
x = Board.new
y = Display.new(x)
y.render