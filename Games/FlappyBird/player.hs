module Player(
  playerCreate,
  playerFly,
  applyGravity,
  playerCycle
) where

import Graphics.UI.Fungen
import Types

playerCreate :: FBirdObject
playerCreate = let birdSprite = Basic(Circle 7.5 0.0 1.0 0.0 Filled)
               in object "bird" birdSprite False (125, 125) (0, 0) ()

playerFly :: Modifiers -> Position -> FBirdAction ()
playerFly _ _ = do
  bird <- findObject "bird" "birdGroup"
  setObjectSpeed (0, 7.5) bird

applyGravity :: FBirdAction ()
applyGravity = do
  bird <- findObject "bird" "birdGroup"
  (x, y) <- getObjectSpeed bird
  when (y > -7.5) (do setObjectSpeed (x, (y-0.75)) bird)

playerCycle :: FBirdAction ()
playerCycle = do
  applyGravity
