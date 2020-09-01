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
  end

  def test_it_can_lose
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    computer = Computer.new
    expected_1 = false
    actual_1 = computer.has_lost?
    assert_equal expected_1, actual_1

    computer.cruiser.hit
    computer.cruiser.hit
    computer.cruiser.hit
    computer.submarine.hit
    computer.submarine.hit

    expected_2 = true
    actual_2 = computer.has_lost?
    assert_equal expected_2, actual_2
  end
end
