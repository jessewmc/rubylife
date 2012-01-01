class ConwayRules

  require_relative '../engine/gameboard.rb'

  #returns a new GameOfLifeBoard object representing the next
  #generation as calculated from this generation
  def next_gen(board)

    next_board = GameBoard.new(board.size)

    board.each_index do |x, y|
      neighbours=0
      (x-1).upto(x+1) do |i|
        (y-1).upto(y+1) do |j|

          if board.cells(i,j).alive? then neighbours +=1 end

        end
      end

      if board.cells(x,y).alive?
        neighbours-=1
        if (2..3).member? neighbours
          next_board.cells(x,y).alive!
        end
      elsif neighbours == 3
        next_board.cells(x,y).alive!
      end
    end

    return next_board
  end

end
