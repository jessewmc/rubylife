class GameOfLife
  
  require 'gol_board.rb'
  require 'gol_cell.rb'

  def initialize

    #todo: nuke magic number
    @magic = 6
    @board = GameOfLifeBoard.new(@magic)

  end

  def load_board(filename)
    private_load(filename)
  end

  private
    
    #inelegant parallel iteration
    def private_load(filename)
      File.open(filename) do |f|

        #Strip newlines from cel file
        raw_board = f.read.gsub(/\n/, "")

        position=0
        @board.each_cell do |cell|
          #todo: nuke magic number
          #120 is char code for "x" which is
          #a live cell
          if raw_board[position] == 120
            cell.alive!
          end
          position += 1
        end
      end
    end

end
