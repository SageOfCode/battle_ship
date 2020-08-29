class Computer
  attr_reader :board, :ships

  def initialize(board, ships)
    @board = board
    @ships = ships
  end
end
