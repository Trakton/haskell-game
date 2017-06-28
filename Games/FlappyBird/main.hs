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
  gs <- getGameState
  case gs of
    LevelStart n -> do
      case n of
        4 -> do disableMapDrawing
                win <- findObject "win" "msgs"
                drawObject win
        _ -> do disableMapDrawing
                level <- findObject ("level"++(show n)) "msgs"
                drawObject level
    Level n -> do return()
    GameOver -> do gameover <- findObject "gameover" "msgs"
                   disableMapDrawing
                   drawObject gameover
    Win -> do win <- findObject "win" "msgs"
              disableMapDrawing
              drawObject win

stateControl :: Modifiers -> Position -> FBirdAction ()
stateControl m p = do
  gs <- getGameState
  case gs of
    LevelStart n -> do
      case n of
        4 -> do funExit
        _ -> do setGameState (Level (n))
                drawMap
    Level n -> do playerFly m p
    GameOver -> funExit
    Win -> funExit

main :: IO()
main = do
  let winConfig = ((0,0), windowResolution, "Flappy Bird")
      gameMap = textureMap 0 50 50 250.0 250.0
      walls = objectGroup "walls" createWalls
      player = objectGroup "player" [playerCreate]
      msgs = objectGroup "msgs" createMsgs
      floor = objectGroup "floor" createFloor
      input = [(SpecialKey KeyUp, Press, stateControl)]
      startingAttributes = GA 0 ((snd windowResolution)`div`2)
  funInit winConfig gameMap [player, walls, msgs, floor] (LevelStart 1) startingAttributes input gameCycle (Timer 40) bmpList
