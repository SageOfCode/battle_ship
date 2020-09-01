class Turn
  attr_reader :player, :computer

  def initialize(player, computer)
    @player = player
    @computer = computer
  end

  def main_menu
    @player = Player.new
    @computer = Computer.new
      puts "  💫 Welcome to SpaceWars 💫"
      puts "Enter p to start the battle. Enter q to quit."

      user_input = gets.chomp.upcase
      if user_input == "P"
        explanation
      elsif user_input == "Q"
        p "Oh no, we're doomed!"
      else
        p "Oops, something went wrong. Try again"
        main_menu
    end
  end

  def explanation
    computer.place_cruiser
    computer.place_submarine
    puts "👩‍🚀 'Hello Captain, I'm Commander Miranda Keyes.
    The aliens are wreaking havoc in the 5th Galactic Quadrant.
    We've deciphered their cloaking technology and applied it to our ships.
    The Space Cruiser spans 3 galactic units, and the Shuttle spans 2.
    Deploy your Starships strategically.'"
    puts "#{player.board.render(true)}"
    puts "Enter the coordinates for the Space Cruiser (3 spaces):"

    place_cruiser_logic

  end

  def place_cruiser_logic
    player.place_cruiser
     if Board.new.render == player.board.render
       puts " "
       p "Invalid cruiser placement, try again."
       puts " "
       explanation
     elsif Board.new.render != player.board.render
       place_submarine_logic
     else
       explanation
     end
  end

  def place_submarine_logic
    puts "Enter the squares for the Submarine (2 spaces):"
    player.place_submarine
     if Board.new.render == player.board.render
       p "Invalid submarine placement, try again."
       puts " "
       explanation
     elsif Board.new.render != player.board.render
       turn_logic
     else
       explanation
     end
  end

  def turn_logic
    until player.has_lost? || computer.has_lost?
      player_fire
    end
    win_lose_statement
  end

    def player_fire
      puts "👾=== Alien Fleet ===👾"
      puts computer.board.render
      puts "Pick a coordinate to attack:"
      player_fire_coords = gets.chomp.upcase
      if computer.board.cells.keys.include?(player_fire_coords) &&
        !computer.board.cells[player_fire_coords].fired_upon? &&
        computer.board.cells[player_fire_coords].ship == nil
        computer.board.cells[player_fire_coords].fire_upon
          if !computer.has_lost?
            computer_fire
          else turn_logic
          end
      elsif computer.board.cells.keys.include?(player_fire_coords) &&
        !computer.board.cells[player_fire_coords].fired_upon?
        computer.board.cells[player_fire_coords].fire_upon
        computer.board.cells[player_fire_coords].ship.hit
          if !computer.has_lost?
            computer_fire
          else turn_logic
          end
      elsif !computer.board.cells.keys.include?(player_fire_coords)
          p "Invalid shot, please choose a valid coordinate:"
          player_fire
        else
          p "You've already shot here! Try again."
          player_fire
      end
    end

    def computer_fire
      computer_fire_coords = computer.board.cells.keys.sample
      if player.board.cells.keys.include?(computer_fire_coords) &&
        !player.board.cells[computer_fire_coords].fired_upon? &&
        player.board.cells[computer_fire_coords].ship == nil
        player.board.cells[computer_fire_coords].fire_upon
        puts "Here's where the Alien's phasers hit:"
        puts "🌟=== Earth Alliance ===🌟"
        puts player.board.render(true)
        sleep(2)
        turn_logic
      elsif player.board.cells.keys.include?(computer_fire_coords) &&
        !player.board.cells[computer_fire_coords].fired_upon?
        player.board.cells[computer_fire_coords].fire_upon
        player.board.cells[computer_fire_coords].ship.hit
        puts "Here's where the Alien's phasers hit:"
        puts "🌟=== Earth Alliance ===🌟"
        puts player.board.render(true)
        sleep(2)
        turn_logic
      else
        computer_fire
      end
    end

    def win_lose_statement
      if !player.has_lost?
        puts "👩‍🚀 'We've won the battle! Great work Captain.'"
        puts "👾=== Alien Fleet ===👾"
        puts computer.board.render
        sleep(1)
        puts "👩‍🚀 'Let's prepare for the next battle."
        sleep(1)
        main_menu
      elsif !computer.has_lost?
        puts "👽 'Puny humans have been defeated.'"
        puts "👽 'Time to take over Earth.'"
        puts "🌟=== Earth Alliance ===🌟"
        puts player.board.render(true)
        sleep(1)
        puts "👩‍🚀 'Captain we must prepare for the next invasion.'"
        sleep(1)
        main_menu
      else
        p "the game is broken :("
      end
      exit
    end
end
