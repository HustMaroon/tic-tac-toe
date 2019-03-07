# author: thanhdx
class Board
  module Mark
    X = 'x'
    O = 'o'
  end
  attr_accessor :cells

  def initialize(num_of_rows:)
    self.cells = Array.new(num_of_rows) { Array.new(num_of_rows) }
    self.cells = cells.map { |row| row.map { |cell| cell = ' ' } }
  end

  def mark(row:, col:, mark:)
    cells[row][col] = mark
  end

  def draw
    cells.each_with_index do |_row, index|
      print '  ' + ' ' * (2 - index.to_s.length) + "#{index + 1}"
    end
    print "\n"
    cells.each_with_index do |row, index|
      print ' '
      print '|---' * cells.count + '|'
      print "\n"
      print index + 1
      row.each do |cell|
        print "  #{cell} "
      end
      print "\n"
    end
    puts ' ' + '|---' * cells.count + '|'
  end

  def row_exist
    cells.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        next if cell == ' '

        if cell == cells.dig(row_index, col_index + 1)
          return cell if cell == cells.dig(row_index, col_index + 2)
        elsif cell == cells.dig(row_index + 1, col_index)
          return cell if cell == cells.dig(row_index + 2, col_index)
        elsif cell == cells.dig(row_index + 1, col_index + 1)
          return cell if cell == cells.dig(row_index + 2, col_index + 2)
        end
      end
    end
    false
  end

  def fulfilled?
    cells.each do |row|
      return false if row.include?(' ')
    end
    true
  end
end
