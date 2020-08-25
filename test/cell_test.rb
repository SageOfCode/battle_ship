require './lib/ship'
require './lib/cell'
require 'Minitest/autorun'
require 'Minitest/pride'

class CellTest < Minitest::Test

  def test_that_it_exists_and_has_attributes
    cell = Cell.new("B4")
    assert_instance_of Cell, cell
    assert_equal "B4", cell.coordinate
    assert_nil cell.ship
  end

  def test_it_knows_if_empty
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    assert_equal true, cell.empty?
    cell.place_ship(cruiser)
    assert_equal false, cell.empty?
  end

  def test_ship_can_be_placed
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship
  end

  def test_it_can_be_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    assert_equal false, cell.fired_upon?
    cell.fire_upon
    assert_equal true, cell.fired_upon?
  end
end
