require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require 'Minitest/autorun'
require 'Minitest/pride'

class PlayerTest < Minitest::Test

  def test_that_it_exists_and_has_attributes
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    player = Player.new

    assert_instance_of Player, player
    expected_1 = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    assert_equal expected_1, player.board.render
  end

  def test_player_can_place_ships
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    player = Player.new

    player.board.place(cruiser, ["A1", "A2", "A3"])
    expected_placed = "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"
    actual_placed = player.board.render(true)
    assert_equal expected_placed, actual_placed

    player.board.place(submarine, ["B1", "B2"])
    expected_placed_2 = "  1 2 3 4 \nA S S S . \nB S S . . \nC . . . . \nD . . . . \n"
    actual_placed_2 = player.board.render(true)
    assert_equal expected_placed_2, actual_placed_2
  end

  def test_it_can_lose
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    player = Player.new
    expected_1 = false
    actual_1 = player.has_lost?
    assert_equal expected_1, actual_1

    player.cruiser.hit
    player.cruiser.hit
    player.cruiser.hit
    player.submarine.hit
    player.submarine.hit

    expected_2 = true
    actual_2 = player.has_lost?
    assert_equal expected_2, actual_2
  end

end
