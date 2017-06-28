module Main where
import Graphics.UI.Fungen
import Types
import Player
import Textures
import Variables
import ObstacleManager

gameCycle :: FBirdAction ()
gameCycle = do
  gs <- getGameState
  case gs of
    Level n -> do playerCycle
                  obstacleManagerCycle
    GameOver -> do gameover <- findObject "gameover" "msgs"
                   disableMapDrawing
                   drawObject gameover

main :: IO()
main = do
  let winConfig = ((0,0), windowResolution, "Flappy Bird")
      gameMap = textureMap 0 50 50 250.0 250.0
      player = objectGroup "player" [playerCreate]
      walls = objectGroup "walls" createWalls
      msgs = objectGroup "msgs" createMsgs
      floor = objectGroup "floor" createFloor
      input = [(SpecialKey KeyUp, Press, playerFly)]
      startingAttributes = GA 0 "wall0"
  funInit winConfig gameMap [player, walls, msgs, floor] (Level 0) startingAttributes input gameCycle (Timer 40) bmpList
