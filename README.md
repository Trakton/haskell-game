# haskell-game

To run the games, you must have Cabal installed in your OS. You can get it here:

https://www.haskell.org/cabal/download.html

But the easiest way to install Cabal, is just by installing the Haskell Platform: 

https://www.haskell.org/platform/

Then, you have to install FunGEn engine. Just run:

$ cabal update

$ cabal install FunGEn 

To compile a game, cd to it's folder and run:

ghc main.hs -outputdir="bin" && ./main
