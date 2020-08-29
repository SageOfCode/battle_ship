require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/computer'
require './lib/turn'

game = Turn.new(Player.new, Computer.new)

game.main_menu
