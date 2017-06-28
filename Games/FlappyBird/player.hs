module Player(
  playerCreate,
  playerFly,
  playerCycle
) where

import Graphics.UI.Fungen
import Types
import Variables
import ObstacleManager

flySpeed = 10.0
maxFallSpeed = -10.0
startPosition = (((fst windowResolution)`div`8), ((snd windowResolution)`div`2))

playerCreate :: FBirdObject
playerCreate = let sprite = Basic(Circle 7.5 0.0 1.0 0.0 Filled)
               in object "player" sprite False (256, 307.5) (0, 0) ()

playerFly :: Modifiers -> Position -> FBirdAction ()
playerFly _ _ = do
  player <- findObject "player" "player"
  setObjectSpeed (0, flySpeed) player

playerCycle :: FBirdAction ()
playerCycle = do
  gs <- getGameState
  case gs of
    LevelStart n -> do player <- findObject "player" "player"
                       setObjectAsleep True player
    Level n -> do player <- findObject "player" "player"
                  setObjectAsleep False player
                  applyGravity
                  handleCollisions n
    GameOver -> do return()
    Win -> do player <- findObject "player" "player"
              setObjectAsleep True player

applyGravity :: FBirdAction ()
applyGravity = do
  player <- findObject "player" "player"
  (x, y) <- getObjectSpeed player
  when (y > maxFallSpeed) (do setObjectSpeed (x, (y-gravity)) player)

handleCollisions :: Int -> FBirdAction ()
handleCollisions level = do
  player <- findObject "player" "player"
  floor <- getObjectsFromGroup "floor"
  floorCol <- objectListObjectCollision floor player
  walls <- getObjectsFromGroup "walls"
  wallCol <- objectListObjectCollision walls player
  when (floorCol || wallCol) (do
    setObjectSpeed (0,0) player
    stopWalls walls (level*2)
    setGameState (GameOver)
                            )
