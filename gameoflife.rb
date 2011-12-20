class GameOfLife
  
  require 'gol_board.rb'
  require 'gol_cell.rb'

  def init

    #todo: nuke magic number
    @magic = 6
    @board = GameOfLifeBoard.new(@magic)

  end

  private
    
    def load_board(filename)
      File.open(filename) do |f|

        #Strip newlines from cel file
        raw_board = f.read.gsub(/\n/, "")



        

end
