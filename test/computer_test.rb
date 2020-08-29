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
    computer = Computer.new

    assert_instance_of Computer, computer

    expected_1 = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    assert_equal expected_1, computer.board.render

    # "No visible difference in the Ship#inspect output."
    # assert_equal  cruiser, computer.cruiser
    # assert_equal  submarine, computer.submarine
  end
end
