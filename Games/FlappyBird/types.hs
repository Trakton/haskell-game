module Types(
  GameAttribute(GA),
  GameState(LevelStart, Level, GameOver),
  FBirdObject,
  FBirdAction
) where

import Graphics.UI.Fungen

data GameAttribute = GA Int [Char]
data GameState = LevelStart Int | Level Int | GameOver

type FBirdObject = GameObject ()
type FBirdAction a = IOGame GameAttribute () GameState () a
