class GameOfLifeBoard

  def initialize(size=50)
    @size = size
    @cells = Array.new(@size) do |i|
      Array.new(size, Cell.new)
    end
  end

  def each_cell
    0.upto(@size-1) do |x|
      0.upto(@size-1) do |y|
        yield @cells[x][y]
      end
    end
  end

end
