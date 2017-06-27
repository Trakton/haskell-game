module Main where
import Graphics.UI.Fungen
import Types
import Player

gameCycle :: FBirdAction ()
gameCycle = do
  playerCycle

main :: IO()
main = do
  let winConfig = ((0,0), (480, 320), "Flappy Bird")
      bmpList = [("tex.bmp", Nothing)]
      gameMap = textureMap 0 50 50 250.0 250.0
      bird = objectGroup "birdGroup" [playerCreate]
      input = [(SpecialKey KeyUp, Press, playerFly)]
      initScore = GameAttribute
  funInit winConfig gameMap [bird] () initScore input gameCycle (Timer 40) bmpList
