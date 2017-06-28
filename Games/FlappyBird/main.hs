module Main where
import Graphics.UI.Fungen
import Types
import Player
import Textures
import Variables
import ObstacleManager
import Text.Printf

gameCycle :: FBirdAction ()
gameCycle = do
  playerCycle
  obstacleManagerCycle
  showScore
  gs <- getGameState
  case gs of
    LevelStart n -> do disableMapDrawing
                       level <- findObject ("level"++(show n)) "msgs"
                       drawObject level
    Level n -> do (GA score _ _) <- getGameAttribute
                  when (score >= n*n) (do
                  if(n < 3) then do setGameState (LevelStart (n+1))
                  else do setGameState (Win)
                                     )
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
    LevelStart n -> do setGameState (Level (n))
                       drawMap
    Level n -> do playerFly m p
    GameOver -> funExit
    Win -> funExit

showScore :: FBirdAction ()
showScore = do
  (GA score _ _) <- getGameAttribute
  ga <- getGameState
  case ga of
    LevelStart n -> return()
    Level n -> do printOnScreen (printf "Score: %d    Level: %d" score n) TimesRoman24 (40,(fromIntegral(snd windowResolution)-60)) 1.0 1.0 1.0
    GameOver -> return()
    Win -> return()

main :: IO()
main = do
  let winConfig = ((0,0), windowResolution, "Flappy Bird")
      gameMap = textureMap 0 50 50 250.0 250.0
      walls = objectGroup "walls" createWalls
      player = objectGroup "player" [playerCreate]
      msgs = objectGroup "msgs" createMsgs
      floor = objectGroup "floor" createFloor
      input = [(SpecialKey KeyUp, Press, stateControl)]
      startingAttributes = GA 0 ((snd windowResolution)`div`2) False
  funInit winConfig gameMap [player, walls, msgs, floor] (LevelStart 1) startingAttributes input gameCycle (Timer 40) bmpList
