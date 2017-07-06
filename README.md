# Flappy Bird

That's a simple game made in a pure functional programming language.

To run the game, you must have Cabal installed in your OS. You can get it here:

https://www.haskell.org/cabal/download.html

But the easiest way to install Cabal, is just by installing the Haskell Platform: 

https://www.haskell.org/platform/

Then, you have to install FunGEn engine. Just run:

$ cabal update

$ cabal install FunGEn 

To compile the game, cd to FlappyBird folder and run:

ghc main.hs -outputdir="bin" && ./main

# How to play:

The game has 3 levels. You are going to level up each at score 5, 10 and 15.

Controls : Press the up arrow key to control the bird and to pass the menu scenes.
