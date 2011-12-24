class GameOfLifeBoard

  def initialize(size=50)

    @size = size
    @cells = new_board(@size)

  end

  #todo: which of these is more idiomatic?
  def each_cell

    0.upto(@size-1) do |x|
      0.upto(@size-1) do |y|
        yield @cells[x][y]
      end
    end

    @cells

  end

  def each_index

    0.upto(@size-1) do |x|
      0.upto(@size-1) do |y|
        yield x,y
      end
    end

  end

  def other_each

    @cells.each_with_index do |i,j|
      i.each_index do |k|
        yield @cells[j][k]
      end
    end
  
  end

  def next_gen

    next_board = new_board(@size)

    0.upto(@size-1) do |x|
      0.upto(@size-1) do |y|
        neighbours=0
        (x-1).upto(x+1) do |i|
          (y-1).upto(y+1) do |j|
            if @cells[i][j].nil?
              next
            end

            if @cells[i][j].alive?
              neighbours+=1
            end
          end
        end
        if @cells[x][y].alive?
          neighbours-=1
          if (2..3).member? neighbours
            @new[x][y].alive!
          end
        else
          if neighbours == 3
            @new[x][y].alive!
          end
        end
      end
    end
    return new_board
  end

  private
    
    def new_board(size)
      board = Array.new(size) do
        Array.new(size, Cell.new)
      end
      board
    end

end
