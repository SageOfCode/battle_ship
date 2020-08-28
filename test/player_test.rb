require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require 'Minitest/autorun'
require 'Minitest/pride'

class PlayerTest < Minitest::Test

  def test_it_exists
    board = Board.new
    player = Player.new(board)

    assert_instance_of Player, player
  end
end
