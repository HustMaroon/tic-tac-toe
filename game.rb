require_relative 'board.rb'
class Game

  attr_accessor :board, :turn, :num_of_rows

  def initialize(num_of_rows:)
    self.num_of_rows = num_of_rows
    self.board = Board.new(num_of_rows: num_of_rows)
    self.turn = 0
    board.draw
  end

  def mark_at(opt)
    self.turn = turn + 1
    self.turn = 1 if turn == 3
    mark = turn == 1 ? Board::Mark::X : Board::Mark::O
    row = opt[0].to_i - 1
    col = opt[1].to_i - 1
    board.mark(row: row, col: col, mark: mark)
    board.draw
  end

  def game_over?
    return true if board.row_exist

    board.fulfilled?
  end
end