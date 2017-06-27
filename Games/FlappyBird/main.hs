module Main where
import Graphics.UI.Fungen
import Types
import Player
import Textures
import Variables
import ObstacleManager

gameCycle :: FBirdAction ()
gameCycle = do
  playerCycle
  obstacleManagerCycle

main :: IO()
main = do
  let winConfig = ((0,0), windowResolution, "Flappy Bird")
      gameMap = textureMap 0 50 50 250.0 250.0
      player = objectGroup "player" [playerCreate]
      walls = objectGroup "walls" createWalls
      input = [(SpecialKey KeyUp, Press, playerFly)]
      startingAttributes = GA 0 "wall0"
  funInit winConfig gameMap [player, walls] (Level 0) startingAttributes input gameCycle (Timer 40) bmpList
