class Cell
  
  def initialize(status=false)
    @status = status
  end

  def alive?
    @status
  end

  def alive!
    @status = true
  end

  def dead!
    @status = false
  end
  
end
