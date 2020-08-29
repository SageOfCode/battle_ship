require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/computer'
require './lib/turn'
require 'Minitest/autorun'
require 'Minitest/pride'

class TurnTest < MiniTest::Test

  def test_that_it_exists
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    ships = [cruiser, submarine]
    player_1 = Player.new(board, ships)
    computer_1 = Computer.new(board, ships)
    turn = Turn.new(player_1, computer_1)

    assert_instance_of Turn, turn
  end
end
