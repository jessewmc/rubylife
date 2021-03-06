#Rubylife

This is a simple exercise implementation of Conway's game of life in Ruby. It's pretty
limited right now. The naive implementation and limited visualization capacity make
it most suitable for a visual introduction to the basics of the game (for now). It is
also pretty good for manual experimentation with small patterns. In the future I hope 
to expand its capability.

##Examples

To try it out, make sure that you have execute permission on mainscript.rb. Running 
./mainscript.rb will give you a blurb on usage (on Windows leave out ./ in cmd, goes for all subsequent examples). Or you can try this example if you just want to see what happens:

    $ ./mainscript.rb -i cels/koksgalaxy.cel -g 8

This example shows a period 8 oscillator. After 8 generations, the original is reproduced.

Some patterns produce demonstrably infinite population growth. Try:

    $ ./mainscript.rb -i cels/gosperglidergun.cel -g 90 -d 0.1

Other interesting patterns include so called 'methuselahs.' Make sure your command window 
is maximized (does not play well with Windows) and try:
  
    $ ./mainscript.rb -i cels/acorn.cel -g 100 -d 0.1

This pattern eventually stabilizes after 5206 generations. The current text visualization
and static board size is not adequate to view the complete pattern.

See http://en.wikipedia.org/wiki/Conway's_Game_of_Life for a description of Conway's
rules, history, etc.

Another good resource is http://www.conwaylife.com/wiki/. The Life Wiki contains a vast
catalogue of patterns to try as well as explanation.

##Implementation notes:

My implementation considers anything outside the edges of the .cel file to be dead cells.
Because of this, patterns do not behave well if they run into the edges.

Right now I determine simulation dimensions from the length of the first line and the 
number of lines in the file. I also expect the file to be fully filled in, i.e. there 
should be no lines with a different number of characters than the first line. .cel files 
that don't follow these guidelines will behave strangely!

In the future I would like to implement hashlife (http://www.sciencedirect.com/science/article/pii/0167278984902513), arbitrary board sizes, and some of the pattern file formats at http://conwaylife.com/wiki/.
