module Types(
  GameAttribute(GA),
  FBirdObject,
  FBirdAction
) where

import Graphics.UI.Fungen

data GameAttribute = GA Int [Char]

type FBirdObject = GameObject ()
type FBirdAction a = IOGame GameAttribute () () () a
