class GameOfLifeBoard

  LIVE_CELL = "x"
  DEAD_CELL = "."
  NEW_LINE = "\n"

  def initialize(size = [50,50], board = new_board(size))

    @size = size
    @cells = board

  end
  
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

  #returns a new GameOfLifeBoard object representing the next
  #generation as calculated from this generation
  def next_gen

    next_board = new_board(@size)

    each_index do |x, y|
      neighbours=0
      (x-1).upto(x+1) do |i|
        (y-1).upto(y+1) do |j|

          if @cells[i].nil? then next end

          if @cells[i][j].nil? then next end

          if @cells[i][j].alive? then neighbours +=1 end

        end
      end

      if @cells[x][y].alive?
        neighbours-=1
        if (2..3).member? neighbours
          next_board[x][y].alive!
        end
      elsif neighbours == 3
        next_board[x][y].alive!
      end
    end

    return GameOfLifeBoard.new(@size, next_board)
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

    #Sequentially iterates over each cell in the matrix and
    #yields the cell's coordinates.

    def each_index
      0.upto(@size[0]-1) do |x|
        0.upto(@size[1]-1) do |y|
          yield x,y
        end
      end
    end

end
