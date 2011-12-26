class ConwayRules
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
