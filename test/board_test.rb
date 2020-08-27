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

  def test_knows_valid_rows
    board = Board.new
    valid_placement_1 = ["A1", "A2", "A3"]
    valid_placement_2 = ["A1", "B1", "C1"]
    invalid_placement = ["A1", "C1", "B1"]

    assert_equal true, board.valid_row?(valid_placement_1)
    assert_equal false, board.valid_row?(valid_placement_2)
    assert_equal false, board.valid_row?(invalid_placement)
  end

  def test_knows_valid_columns
    board = Board.new
    valid_placement_1 = ["A1", "A2", "A3"]
    valid_placement_2 = ["A1", "B1", "C1"]
    invalid_placement = ["A1", "C1", "B1"]

    assert_equal false, board.valid_column?(valid_placement_1)
    assert_equal true, board.valid_column?(valid_placement_2)
    assert_equal true, board.valid_column?(invalid_placement)
  end

  def test_cannot_be_diagonal
    skip
    board = Board.new
    first_placement = ["A1", "A2", "A3"]
    second_placement = ["A1", "B2", "C3"]
    assert_equal true, board.valid_row?(first_placement)
    assert_equal false, board.valid_row?(second_placement)
    assert_equal true, board.valid_column?(first_placement)
    assert_equal false, board.valid_column?(second_placement)
  end

  def test_coordinates_are_sequential
    board = Board.new

    valid_row_placement_1   = ["A1", "A2", "A3"]
    invalid_row_placement_1 = ["D3", "C2", "B1"]
    valid_column_placement_1   = ["A1", "B1", "C1"]
    invalid_column_placement_1 = ["D3", "D2", "D1"]

    assert_equal true, board.sequential_row_coords?(valid_row_placement_1)
    assert_equal false, board.sequential_row_coords?(invalid_row_placement_1)
    assert_equal true, board.sequential_column_coords?(valid_column_placement_1)
    assert_equal false, board.sequential_column_coords?(invalid_column_placement_1)
  end
end
