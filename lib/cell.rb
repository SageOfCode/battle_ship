class Cell
  attr_reader :coordinate, :ship

<<<<<<< HEAD
  def initialize(coordinate, ship = nil, fired_at = false, render = ".")
    @coordinate = coordinate
    @ship = ship
    @fired_at = fired_at
    @render = render
=======
  def initialize(coordinate, ship = nil)
    @coordinate = coordinate
    @ship = ship
>>>>>>> b8e9eba31fa3926d0c0da1a83a23c7771befc688
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
<<<<<<< HEAD
    @ship = ship
  end

  def fired_upon?
    @fired_at == true
  end

  def fire_upon
    @fired_at = true
  end

  def render(apple = false)
    if empty? == false && @ship.sunk? == true
      @render = "X"
    elsif apple == true && empty? == false && fired_upon? == false
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

=======
    @ship = ship 
>>>>>>> b8e9eba31fa3926d0c0da1a83a23c7771befc688
  end
end
