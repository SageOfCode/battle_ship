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
  # if rows.uniq.size == 1 ||
  #   true
  # elsif rows.uniq.size > 1
  #   if coordinates.count == 2
  #     ord_values.each_cons(2).all? {|first, second| second == first + 1 }
  #   each cons with any? if it returns -1
  #   ord_values.any?.with_index do |value, index|
  #     return true unless ord_values[index + 1]
  #     value - ord_values[index + 1] == -1
  #   true
  #   end
  # else
  #   false
  # end


  def valid_placement?(ship, coordinates)
    ship.length == coordinates.count
    #think about making boolean returns method1 && method2 && method3
    # X axis increments by 1 and Y axis increments by 1
  end
end
