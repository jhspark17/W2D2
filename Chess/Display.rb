require_relative "board"
require_relative "cursor"
require "colorize"

class Display
  attr_reader :board, :cursor
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    self.board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |piece, col|
          if self.cursor.cursor_pos == [row_idx, col]
            print piece.to_s.colorize(:red)
          else
            print piece.to_s
          end
      end
     puts
    end
    return nil
  end
  
  # def run 
  #   while true
  #     system('clear')
  #     render
  #     @cursor.get_input
  #   end
  # end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  d.render
  # d.run
end
