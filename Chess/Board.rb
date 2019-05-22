require_relative "Piece"
require 'byebug'
require "colorize"

class Board
  
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    populate_board
  end

  def populate_board
    
    @grid.each_with_index do |sub, i|
      (0...sub.length).each do |j|
        if i == 0 || i == 1 || i == 6 || i == 7
          @grid[i][j] = Piece.new
        else
          @grid[i][j] = NullPiece.instance
        end
      end
    end

  end

  def move_piece(start_pos, end_pos)
    startx, starty = start_pos #assuming is an array  8, 0
    endx, endy = end_pos #assuming is an array 4,5
    
    if endx > 7 || endx < 0 || endy > 7 || endy < 0 || startx > 7 || startx < 0 || starty > 7 || starty < 0
      raise "Out of bounds"
    elsif @grid[startx][starty].is_a?(NullPiece)
      raise "No piece at this starting position"
    # elsif # for lower pieces tring to take stronger piece
    else
      pp temp = @grid[startx][starty] 
      @grid[endx][endy] = temp
      @grid[startx][starty] = NullPiece.instance
    end

    # rescue
    #   p "help me" #method to get new user input for start position
  end

  # def []=(x, y, value)
  #   @grid[x][y] = @grid[x][y].colorize(:blue)
  # end


end#

