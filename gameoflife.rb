class GameOfLife
  
  require 'gol_board.rb'
  require 'gol_cell.rb'

  def initialize

    #todo: nuke magic number
    @magic = 6
    @board = GameOfLifeBoard.new(@magic)
    @raw_board = ""

  end

  def next_gen!
    @board = @board.next_gen
  end

  def to_s
    position = 1
    pretty_string = ""
    @board.each_cell do |cell|    
      if cell.alive?
        pretty_string << "x"
      else
        pretty_string << "o"
      end

      if position % @magic == 0
        pretty_string << "\n"
      end
      position += 1
    end
    return pretty_string
  end
        
  #load_board expects a text file in the form of
  #oooo
  #oxxo
  #oooo
  #where x is a live cell.
  #todo: get board dimensions from file instead of
  #assuming hardcoded

  def load_board(filename)
    private_load(filename)
  end

  private
    
    #inelegant parallel iteration
    def private_load(filename)

      File.open(filename) do |f|

        #Strip newlines from cel file
        @raw_board = f.read.gsub(/\n/, "")

      end
      
      position=0
      @board.each_cell do |cell|
        #todo: nuke magic number
        #120 is char code for "x" which is
        #a live cell
        if @raw_board[position] == 120
          cell.alive!
        else
          cell.dead!
        end
        position += 1
      end
    end

    #todo: generate initial raw board

end
