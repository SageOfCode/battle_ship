class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate, ship = nil, fired_at = false)
    @coordinate = coordinate
    @ship = ship
    @fired_at = fired_at
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
end
