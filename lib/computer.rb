class Computer
  attr_reader :board, :cruiser, :submarine

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def computer_has_lost?
    @cruiser.sunk? && @submarine.sunk?
  end
end
