require './lib/ship'
require 'Minitest/autorun'
require 'Minitest/pride'


class ShipTest < Minitest::Test


  def test_that_it_exists
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, cruiser
  end

  def test_it_has_attributes
    cruiser = Ship.new("Cruiser", 3)
    assert_equal "Cruiser", cruiser.name
    assert_equal 3, cruiser.length
    assert_equal 3, cruiser.health
  end

  def test_it_can_sink
    cruiser = Ship.new("Cruiser", 3)
    assert_equal false, cruiser.sunk?
    assert_equal 3, cruiser.health
    cruiser.hit
    assert_equal 2, cruiser.health
    cruiser.hit
    assert_equal 1, cruiser.health
    cruiser.hit
    assert_equal 0, cruiser.health
    assert_equal true, cruiser.sunk?
  end

  def test_it_can_be_hit
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, cruiser.health
    cruiser.hit
    assert_equal 2, cruiser.health
    cruiser.hit
    assert_equal 1, cruiser.health
  end

end
