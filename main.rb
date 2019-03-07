require_relative 'cli'
require_relative 'game'

cli = Cli.new
opt = 0
loop do
  break if cli.valid_option?(opt.to_i)
  cli.print_menu
  opt = gets.chomp
end
cli.perform(opt)