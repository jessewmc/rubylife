#!/usr/bin/env ruby
require_relative 'engine/cellularautomata.rb'
require 'optparse'

#Simple script using Ruby's built in command line option parser.

options = {}


optparse = OptionParser.new do |opts|
  
  File.open("usage") do |f|
    opts.banner = f.read
  end

  options[:generations] = 0
  opts.on( '-g', '--generations N', Integer, 'Number of generations to be computed' ) do |g|
    options[:generations] = g
  end

  opts.on( '-o', '--output [FILE]', String, 'Output file to which final generation is written' ) do |o|
    options[:output] = o
  end

  options[:delay] = 0.8
  opts.on( '-d', '--delay N', Float, 'Delay between printed generations in seconds -- try 0 < N < 1' ) do |d|
    options[:delay] = d
  end

  opts.on( '-i', '--input [FILE]', String, 'Input .cel file' ) do |i|
    options[:input] = i
  end
end

optparse.parse!

abort `cat usage` unless options[:input]

game = CellularAutomata.new
game.load_board options[:input]
print game

1.upto options[:generations] do
    sleep options[:delay]
    game.next_gen!
    print "\n"
    print game
end

if options[:output]
  game.write_board(options[:output])
end
