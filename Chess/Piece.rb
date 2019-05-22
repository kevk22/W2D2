require "singleton"
require "colorize"

class Piece

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def moves
    possible_moves
  end

  def to_s
    " P "
  end

  def inspect
    " P "
  end

end

class NullPiece < Piece
  include Singleton
  def initialize
  end

  def inspect
    " N "
  end

  def to_s
    " N "
  end


end

module Slideable
  HORIZONTAL_DIRS = [
    [0,1],[1,0],
    [-1,0],[0,-1]
  ]
  DIAGONAL_DIRS = [
    [1,1],[-1,-1],
    [-1,1],[1,-1]
  ]

end

module Stepable
  def moves
  end

  private 
  def move_diffs
  end
end