class Player
  attr_reader :board, :cruiser, :submarine

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def has_lost?
    @cruiser.sunk? && @submarine.sunk?
  end

  def place_cruiser
    cruiser_coords = gets.chomp.upcase.split
    if cruiser_coords.count < 2
      puts "place cruiser error"
    elsif board.valid_placement?(cruiser, cruiser_coords)
      board.place(cruiser, cruiser_coords)
      puts "🌟=== Your Placed Space Cruiser ===🌟"
      puts board.render(true)
    end
  end

  def place_submarine
      submarine_coords = gets.chomp.upcase.split
      if submarine_coords.count < 2
        puts "Invalid submarine placement. Please enter two valid coordinates:"
        place_submarine
      elsif board.valid_placement?(submarine, submarine_coords)
        board.place(submarine, submarine_coords)
        puts "🌟=== Your Placed Starships ===🌟"
        puts board.render(true)
        sleep(2)
      else
        p "placement broke, please try again"
        place_submarine
      end
  end
end
