require_relative 'game.rb'
require 'byebug'
class Cli
  def print_menu
    p 'Enter your choice:'
    p '1. New game'
    p '2. exit'
  end

  def valid_option?(option)
    [1, 2].include?(option)
  end

  def perform(opt)
    if opt.to_i == 1
      option = 0
      loop do
        p 'enter number of rows (<10)'
        option = gets.chomp.to_i
        break if option >= 3 && option <= 9
      end
      p 'start game'
      start_game(option)
    elsif opt.to_i == 2
      exit
    end
  end

  def start_game(option)
    game = Game.new(num_of_rows: option)
    loop do
      if game.game_over?
        # byebug
        p "game over, #{game.game_over? === true ? "draw" : game.game_over? + ' wins'}"
        print_menu
        break
      else
        p game.turn == 1 ? "#{Board::Mark::O}'s turn:" : "#{Board::Mark::X}'s turn:"
        opt = gets.chomp.to_s
        loop do
          break if valid_mark?(game, opt)

          p 'invalid mark, try again:'
          opt = gets.chomp.to_s
        end
        game.mark_at(opt)
      end
    end
  end

  private

  def valid_mark?(game, opt)
    pattern = /\A\d\d/
    return false unless pattern.match?(opt)
    row = opt[0].to_i
    col = opt[1].to_i
    row != 0 && col != 0 && row <= game.num_of_rows && col <= game.num_of_rows && game.board.cells[row - 1][col - 1] == ' '
  end
end