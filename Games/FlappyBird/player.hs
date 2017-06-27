module Player(
  playerCreate,
  playerFly,
  playerCycle
) where

import Graphics.UI.Fungen
import Types
import Variables

flySpeed = 7.5
maxFallSpeed = -7.5
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
  applyGravity

applyGravity :: FBirdAction ()
applyGravity = do
  player <- findObject "player" "player"
  (x, y) <- getObjectSpeed player
  when (y > maxFallSpeed) (do setObjectSpeed (x, (y-gravity)) player)
