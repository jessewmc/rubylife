class GameOfLifeBoard

  def initialize(size=50)
    @size = size
    @cells = Array.new(@size) do |i|
      Array.new(size, Cell.new)
    end
  end

end
