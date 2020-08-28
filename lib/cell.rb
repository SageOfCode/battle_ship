class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate, ship = nil, fired_at = false, render = ".")
    @coordinate = coordinate
    @ship = ship
    @fired_at = fired_at
    @render = render
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_at == true
  end

  def fire_upon
    @fired_at = true
  end

  def render(show_board = false)
    if empty? == false && @ship.sunk? == true
      @render = "X"
    elsif show_board == true && empty? == false && fired_upon? == false
      @render = "S"
    elsif empty? == true && fired_upon? == false
      @render
    elsif empty? == false && fired_upon? == false
      @render
    elsif empty? == true && fired_upon? == true
      @render = "M"
    elsif empty? == false && fired_upon? == true
      @render = "H"
      end
  end
end
