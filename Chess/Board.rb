require_relative "piece"
# require_relative "pieces/test_piece"
# require_relative "test_piece"
# require "./pieces/piece.rb"

require "byebug"
class Board
  
  attr_accessor :grid

  def initialize
    @grid = Array.new
    populate_grid
    self
  end

  def to_s
  
  end

  def []=(pos, value)
    row, column = pos
    grid[row][column] = value
  end
  
  def [](pos)
    row, column = pos
    grid[row][column]
  end

  def populate_grid
   (0..7).each do |row_num|
    row = fill_row(row_num)
    grid.push(row)
   end
  end

  def fill_row(row_idx)
    row = []
    case row_idx
    when 0
     Array.new(8) {Piece.new(self)}
    when 1
     Array.new(8) {Piece.new(self)}
    when 6
     Array.new(8) {Piece.new(self)}
    when 7
     Array.new(8) {Piece.new(self)}
    else
      [NullPiece.instance] * 8
    end
  end

    def move_piece(start_pos, end_pos)
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos] if valid_move?(start_pos, end_pos)
    end

    def valid_move?(start_pos, end_pos)
      begin
        in_bounds?(start_pos, end_pos)
        valid_start?(start_pos)
        valid_end?(end_pos)
      
      rescue RuntimeError => e
        puts "#{e.message}"
      end
      true
    end

    def in_bounds?(start_pos, end_pos=[])
      coordinates = start_pos + end_pos
      coordinates.each do |num|
        return false if  num < 0 || num > 7
        # raise "Make sure all coordinates are between 0-7" if  num < 0 || num > 7
      end
      true
    end

    def valid_start?(start_pos)
      raise "#{start_pos} does not have a piece" if self[start_pos].is_a?(NullPiece)
      true
    end  
      
    def valid_end?(end_pos)
      raise "#{end_pos} already has a piece" unless self[end_pos].is_a?(NullPiece) 
      true
    end
private 


 
  


end