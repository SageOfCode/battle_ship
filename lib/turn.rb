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

    place_cruiser

  end

  def place_cruiser
    cruiser_coords = gets.chomp.upcase.split
    if player.board.valid_placement?(player.cruiser, cruiser_coords)
      player.board.place(player.cruiser, cruiser_coords)
      puts "Here is your board placement:"
      puts player.board.render(true)
      puts "Enter the squares for the Submarine (2 spaces):"
      place_submarine
    elsif player.board.valid_placement?(player.cruiser, cruiser_coords) == false
      p "Try again"
      explanation
    else
      p "Error oops"
      explanation
    end
  end

  def place_submarine
      submarine_coords = gets.chomp.upcase.split
      if player.board.valid_placement?(player.submarine, submarine_coords)
        player.board.place(player.submarine, submarine_coords)
        puts "Here is your board placement:"
        puts player.board.render(true)
        computer_place_cruiser
      elsif player.board.valid_placement?(player.submarine, submarine_coords) == false
        p "Try again"
        place_submarine
      else
        p "Error oops"
        place_submarine
      end
  end

  def computer_place_cruiser
    comp_cruiser_coords = computer.board.cells.keys.sample(3)
    if computer.board.valid_placement?(computer.cruiser, comp_cruiser_coords)
      computer.board.place(computer.cruiser, comp_cruiser_coords)
      computer_place_submarine
    else
      computer_place_cruiser
    end
  end

  def computer_place_submarine
    comp_submarine_coords = computer.board.cells.keys.sample(2)
    if computer.board.valid_placement?(computer.submarine, comp_submarine_coords)
      computer.board.place(computer.submarine, comp_submarine_coords)
      puts computer.board.render(true)
      next_step
    else
      computer_place_submarine
    end
  end

    def next_step
      p "We made it!"

    end

end
