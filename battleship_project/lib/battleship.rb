require_relative "board"
require_relative "player"

require "byebug"

class Battleship

  attr_reader :board, :player
  
  def initialize (n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size/2
  end

  def start_game
    @board.place_random_ships
    @board.num_ships
    Board.print_grid(@board)
  end

end # end Battleship Class
