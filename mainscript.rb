#!/usr/bin/ruby
require 'engine/cellularautomata.rb'

if ARGV.size == 0
  #exits program and prints string argument. `...` is the string containing
  #the result of the commandline command
  abort `cat usage`
end

game = CellularAutomata.new
game.load_board "#{ARGV[0]}"
print game

if ARGV.size == 2
  1.upto ARGV[1].to_i do
    sleep 0.8
    game.next_gen!
    print "\n"
    print game
  end
end

