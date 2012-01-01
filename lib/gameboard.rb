#todo: make this gameboard, remove next_gen
#load/dump should be here?

class GameBoard

  LIVE_CELL = "X"
  DEAD_CELL = "."
  NEW_LINE = "\n"

  def initialize(size = [50,50])

    @size = size
    @cells = new_board(size)

  end

  def size
    @size.dup
  end

  def cells(x,y)
    if x < 0 || y < 0 || x >= @size[0] || y >= @size[1]
      return Cell.new
    else
      return @cells[x][y]
    end
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

      if position % @size[1] == 0
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

  def write(filename)

    #Open file in append mode, won't clobber pre-existing file
    File.open(filename, "a") do |f|
      
      #implicitly calls to_s
      f.write self

    end
  end

  def load(filename)

    raw_board = ""

    File.open(filename) do |f|

      #strip newlines from cel file, determine length
      #and width of board in file, produce raw board string
      #without newlines

      raw_str = f.read
      split_str = raw_str.to_s.split("\n")
      @size[1] = split_str[0].size
      @size[0] = split_str.size
      raw_board = split_str.join

    end

    @cells=new_board(@size)

    #inelegant parallel iteration
    position=0
    each_cell do |cell|
      #todo: nuke magic number
      #"x" is the expected encoding of a live cell, all other
      #characters are considered dead
      if raw_board[position] == "x" 
        cell.alive!
      else
        cell.dead!
      end
      position += 1
    end

    return @size
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
