module Player(
  playerCreate,
  playerFly,
  applyGravity,
  playerCycle
) where

import Graphics.UI.Fungen
import Types

playerCreate :: FBirdObject
playerCreate = let sprite = Basic(Circle 7.5 0.0 1.0 0.0 Filled)
               in object "player" sprite False (125, 125) (0, 0) ()

playerFly :: Modifiers -> Position -> FBirdAction ()
playerFly _ _ = do
  player <- findObject "player" "player"
  setObjectSpeed (0, 7.5) player

applyGravity :: FBirdAction ()
applyGravity = do
  player <- findObject "player" "player"
  (x, y) <- getObjectSpeed player
  when (y > -7.5) (do setObjectSpeed (x, (y-0.75)) player)

playerCycle :: FBirdAction ()
playerCycle = do
  applyGravity
