#todo: make this gameboard, remove next_gen
#load/dump should be here?

class GameBoard

  LIVE_CELL = "x"
  DEAD_CELL = "."
  NEW_LINE = "\n"

  attr_reader :size
  attr_accessor :cells

  def initialize(size = [50,50])

    @size = size
    @cells = new_board(size)

  end

  #todo: dump current board to file
  
  def to_s
    position = 1
    pretty_string = ""
    each_cell do |cell|    
      if cell.alive?
        pretty_string << LIVE_CELL
      else
        pretty_string << DEAD_CELL
      end

      if position % @size[0] == 0
        pretty_string << NEW_LINE
      end
      position += 1
    end
    return pretty_string
  end

  #iterates over cell matrix sequentially
  def each_cell

    each_index do |x, y|
      yield @cells[x][y]
    end

    @cells

  end

  #Sequentially iterates over cell matrix, yielding each set of coordinates
  def each_index
    0.upto(@size[0]-1) do |x|
      0.upto(@size[1]-1) do |y|
        yield x,y
      end
    end
  end

  private
    
    #Creates a new array for board use. Size is expected to be
    #a two element array of Fixnums [x,y] producing an array x by y.

    def new_board(size)
      board = Array.new(size[0]) do
        Array.new(size[1]) do
          Cell.new
        end
      end
      board
    end

end
