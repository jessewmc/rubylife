class CellularAutomata
  
  require_relative 'gameboard.rb'
  require_relative 'cell.rb'
  require_relative '../rules/conwayrules.rb'

  def initialize

    @board = GameBoard.new
    @rules = ConwayRules.new

  end

  def next_gen!
    @board = @rules.next_gen(@board)
  end

  def to_s
    @board.to_s
  end
        
  #load_board expects a text file in the form of
  #....
  #.xx.
  #....
  #where x is a live cell.

  def load_board(filename)
    @board.load(filename)
  end

  def write_board(filename)
    @board.write(filename)
  end

end
