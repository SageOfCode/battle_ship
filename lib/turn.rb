class Turn
  attr_reader :player, :computer

  def initialize(player, computer)
    @player = player
    @computer = computer
  end

  def main_menu
    puts "Welcome to BATTLESHIP /nEnter p to play. Enter q to quit."

  end
end
