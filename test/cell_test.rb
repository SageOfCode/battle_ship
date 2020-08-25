require './lib/ship'
require './lib/cell'
require 'Minitest/autorun'
require 'Minitest/pride'

class CellTest < Minitest::Test

  def test_that_it_exists
    cell = Cell.new("B4")
    assert_instance_of Cell, cell 
  end
end
