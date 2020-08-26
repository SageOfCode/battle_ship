require './lib/ship'
require './lib/cell'
require './lib/board'
require 'Minitest/autorun'
require 'Minitest/pride'

class BoardTest < Minitest::Test

  def test_that_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_it_knows_about_cells
    board = Board.new
    assert_equal Hash, board.cells.class
    assert_equal 16, board.cells.keys.count
    assert_instance_of Cell, board.cells["A1"]
  end

  def test_knows_valid_coordinates
    board = Board.new
    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("C3")
    assert_equal false, board.valid_coordinate?("F7")
    assert_equal false, board.valid_coordinate?("Z9")
  end

  def test_knowns_valid_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
    assert_equal true, board.valid_placement?(cruiser, ["B1", "B2", "B3"])
    assert_equal true, board.valid_placement?(submarine, ["C1", "D1"])
  end

  def test_can_split_x_and_y_coordinates
    board = Board.new
    assert_equal [["A", "1"], ["A", "2"]], board.split_coordinates(["A1", "A2"])
    assert_equal [["B", "1"], ["B", "2"], ["B", "3"]], board.split_coordinates(["B1", "B2", "B3"])
  end

  def test_cannot_be_diagonal
    board = Board.new
    first_placement = ["A1", "A2", "A3"]
    second_placement = ["A1", "B2", "C3"]
    assert_equal true, board.valid_row?(first_placement)
    assert_equal false, board.valid_row?(second_placement)
  end

  def test_coordinates_are_consecutive
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
  end
end
