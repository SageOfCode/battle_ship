require './lib/ship'
require 'Minitest/autorun'
require 'Minitest/pride'


class ShipTest < Minitest::Test


def test_that_it_exists
  cruiser = Ship.new("Cruiser", 3)
  assert_instance_of Ship, cruiser
end


def test_it_has_a_name
  

end
end
