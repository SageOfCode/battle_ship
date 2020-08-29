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
      explanation
    elsif user_input == "Q"
      p "See you next time."
    else
      p "Oops, something went wrong. Try again"
      main_menu
    end
  end

  def explanation
    puts "I have laid out my ships on the grid.
You now need to lay out your two ships.
The Cruiser is three units long and the Submarine is two units long.
  1 2 3 4
A . . . .
B . . . .
C . . . .
D . . . .
Enter the squares for the Cruiser (3 spaces):"
user_coords = gets.chomp.upcase
# Check later on how to grab ">" for user input.


  end

end
