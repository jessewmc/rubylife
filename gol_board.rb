class GameOfLifeBoard

  def initialize(size=50)
    @cells = Array.new(size) do |i|
      Array.new(size, Cell.new)
    end
  end

end
