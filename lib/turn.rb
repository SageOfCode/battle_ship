class Turn
  attr_reader :player, :computer

  def initialize(player, computer)
    @player = player
    @computer = computer
  end

  def main_menu
    puts "    Welcome to BATTLESHIP
    Enter p to play. Enter q to quit."

    user_input = gets.chomp.upcase
    if user_input == "P"
      p "play"
    elsif user_input == "Q"
      p "quit"
    else
      p "failed"
    end
  end
end
