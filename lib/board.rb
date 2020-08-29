class Board
attr_reader :cells
  def initialize
    @cells = create_cells
  end

  def create_cells
    {
 "A1" => Cell.new("A1"),
 "A2" => Cell.new("A2"),
 "A3" => Cell.new("A3"),
 "A4" => Cell.new("A4"),
 "B1" => Cell.new("B1"),
 "B2" => Cell.new("B2"),
 "B3" => Cell.new("B3"),
 "B4" => Cell.new("B4"),
 "C1" => Cell.new("C1"),
 "C2" => Cell.new("C2"),
 "C3" => Cell.new("C3"),
 "C4" => Cell.new("C4"),
 "D1" => Cell.new("D1"),
 "D2" => Cell.new("D2"),
 "D3" => Cell.new("D3"),
 "D4" => Cell.new("D4")
}
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def split_coordinates(coordinates)
    coordinates.map do |coordinate|
      coordinate.split("")
    end
  end

  def valid_row?(coordinates)
    split_coordinate = split_coordinates(coordinates)
    rows = split_coordinate.map do |letter|
      letter[0]
    end
    ord_values = rows.map do |row|
      row.ord
    end
    if ord_values.uniq.size == 1
      true
    else
      false
    end
  end

  def valid_column?(coordinates)
    split_coordinate = split_coordinates(coordinates)
    columns = split_coordinate.map do |number|
      number[1]
    end
    ord_values = columns.map do |column|
      column.ord
    end
    if ord_values.uniq.size == 1
      true
    else
      false
    end
  end

  def sequential_row_coords?(coordinates)
    split_coordinate = split_coordinates(coordinates)
    rows = split_coordinate.map do |number|
      number[1]
    end
    if coordinates.length == 2
      (rows.join == ("12")) || (rows.join == ("23")) || (rows.join == ("34"))
    elsif coordinates.length == 3
      (rows.join == ("123")) || (rows.join == ("234"))
    else
      p "oops"
    end
  end

  def sequential_column_coords?(coordinates)
    split_coordinate = split_coordinates(coordinates)
    columns = split_coordinate.map do |number|
      number[0]
    end
    if coordinates.length == 2
      (columns.join == ("AB")) || (columns.join == ("BC")) || (columns.join == ("CD"))
    elsif coordinates.length == 3
      (columns.join == ("ABC")) || (columns.join == ("BCD"))
    else
      p "oops"
    end
  end

  def valid_placement?(ship, coordinates)
    coordinates.all? do |coordinate|
      if @cells[coordinate].empty?
        ship.length == coordinates.count &&
        (valid_row?(coordinates) && sequential_row_coords?(coordinates)) ||
        (valid_column?(coordinates) && sequential_column_coords?(coordinates))
      end
    end
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
          @cells[coordinate].place_ship(ship)
      end
    else
      "Nope!"
    end
  end

  def render(show_board = false)
    if show_board == false
      "  1 2 3 4 \nA #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \nB #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \nC #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \nD #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"
    else
      "  1 2 3 4 \nA #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \nB #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \nC #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \nD #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"
    end
  end
end
