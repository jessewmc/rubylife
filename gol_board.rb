class GameOfLifeBoard

  def initialize(size=50, board = new_board(size))

    @size = size
    @cells = board

  end

  def each_cell

    each_index do |x, y|
      yield @cells[x][y]
    end

    @cells

  end

  #should this be private? Not sure if anything else needs access
  def each_index

    0.upto(@size-1) do |x|
      0.upto(@size-1) do |y|
        yield x,y
      end
    end

  end

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
    
    def new_board(size)
      board = Array.new(size) do
        Array.new(size) do
          Cell.new
        end
      end
      board
    end

end
