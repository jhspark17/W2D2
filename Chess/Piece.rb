require 'singleton'

module SlidingPiece
  HORIZONTAL_DIRS = [[0,1], [0,-1], [1, 0], [-1,0]]
  DIAG_DIRS = [[1,1], [-1,-1], [-1, 1], [1, -1]]
 
  def horizontal_dirs 
    HORIZONTAL_DIRS.freeze
  end 

  def diag_dirs 
    DIAG_DIRS.freeze
  end 

  def moves # relative moves to piece's pos
    answer = []
    move_dirs.each do |dir|
      grow_unblocked_moves_in_dir(dir[0], dir[1])
    end
    answer 
  end 
end

module SteppingPiece

end
class Piece
  attr_writer :pos
 def initialize(color, pos, board)
  @sym = 'p '
  @pos = nil
  @board = board
 end

 def to_s
  @sym
 end
end

class NullPiece < Piece
  include Singleton
  def initialize
    @sym = '. '
  end
end

class Bishop < Piece
  include SlidingPiece 

  def move_dirs 
    horizontal_dirs
  end 
end

class Rook < Piece
  include SlidingPiece
end

class Queen < Piece
  include SlidingPiece

  def move_dirs 
    horizontal_dirs + diag_dirs
    # queen can go in either of these directions! so powerful!
  end 
end

class Knight < Piece
  include SteppingPiece
end

class King < Piece
  include SteppingPiece
end

class Pawns < Piece

end


