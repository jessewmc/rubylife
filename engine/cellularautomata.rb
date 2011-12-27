class CellularAutomata
  
  require 'engine/gameboard.rb'
  require 'engine/cell.rb'
  require 'rules/conwayrules.rb'

  def initialize

    #todo: nuke magic number,
    #make raw_board method
    @magic = [6,6]
    @board = GameBoard.new(@magic)
    @rules = ConwayRules.new

  end

  def next_gen!
    @board = @rules.next_gen(@board)
  end

  def to_s
    @board.to_s
  end
        
  #load_board expects a text file in the form of
  #oooo
  #oxxo
  #oooo
  #where x is a live cell.

  def load_board(filename)
    @board.load(filename)
  end

  def write_board(filename)
    @board.write(filename)
  end

  private
    

    #todo: generate initial raw board

end
