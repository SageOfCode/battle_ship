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
end
