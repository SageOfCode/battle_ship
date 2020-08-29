require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require 'Minitest/autorun'
require 'Minitest/pride'

class ComputerTest < Minitest::Test

  def test_that_it_exists_and_has_attributes
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    ships = [cruiser, submarine]
    computer = Computer.new(board, ships)

    assert_instance_of Computer, computer

    expected_1 = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    assert_equal expected_1, computer.board.render

    assert_equal  [cruiser, submarine], computer.ships
  end
end 
