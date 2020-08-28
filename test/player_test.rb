require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require 'Minitest/autorun'
require 'Minitest/pride'

class PlayerTest < Minitest::Test

  def test_that_it_exists_and_has_attributes
    board = Board.new
    player = Player.new(board)

    assert_instance_of Player, player

    expected_1 = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    assert_equal expected_1, player.board.render
  end

end
