module Types(
  GameAttribute(Score),
  FBirdObject,
  FBirdAction
) where

import Graphics.UI.Fungen

data GameAttribute = Score Int

type FBirdObject = GameObject ()
type FBirdAction a = IOGame GameAttribute () () () a
