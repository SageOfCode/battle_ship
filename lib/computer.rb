class Computer
  attr_reader :board, :cruiser, :submarine

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def has_lost?
    @cruiser.sunk? && @submarine.sunk?
  end

  def place_cruiser
    comp_cruiser_coords = board.cells.keys.sample(3)
    if board.valid_placement?(cruiser, comp_cruiser_coords)
      board.place(cruiser, comp_cruiser_coords)
    else
      place_cruiser
    end
  end

  def place_submarine
    comp_submarine_coords = board.cells.keys.sample(2)
    if board.valid_placement?(submarine, comp_submarine_coords)
      board.place(submarine, comp_submarine_coords)
    else
      place_submarine
    end
  end
end
