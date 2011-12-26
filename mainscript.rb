#!/usr/bin/ruby
require 'engine/cellularautomata.rb'

if ARGV.size == 0
  #exits program and prints string argument. `...` is the string containing
  #the result of the commandline command
  abort `cat README`
end

game = CellularAutomata.new
game.load_board "#{ARGV[0]}"
print game

if ARGV.size == 2
  0.upto ARGV[1].to_i do
    sleep 0.6
    game.next_gen!
    print game
  end
end

