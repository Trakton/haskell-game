module Textures (
  bmpList,
  textureWallIndex,
  textureWallSize
) where

bmpList = [("Sprites/tex.bmp", Nothing),
            ("Sprites/wall.bmp", Nothing)]

textureWallIndex :: Int
textureWallIndex = 1

textureWallSize :: (Double, Double)
textureWallSize = (69, 491)
