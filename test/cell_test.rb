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
<<<<<<< HEAD

  def test_it_can_be_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    assert_equal false, cell.fired_upon?
    cell.fire_upon
    assert_equal true, cell.fired_upon?
  end

  def test_it_can_render
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    assert_equal ".", cell_1.render
    cell_1.fire_upon
    assert_equal "M", cell_1.render
    cell_2.place_ship(cruiser)
    assert_equal ".", cell_2.render
    assert_equal "S", cell_2.render(true)
    cell_2.fire_upon
    cruiser.hit
    assert_equal "H", cell_2.render
    cell_2.fire_upon
    cruiser.hit
    cell_2.fire_upon
    cruiser.hit
    assert_equal "X", cell_2.render
  end
=======
>>>>>>> b8e9eba31fa3926d0c0da1a83a23c7771befc688
end
