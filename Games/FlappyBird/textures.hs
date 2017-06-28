module Textures (
  bmpList,
  textureWallIndex, textureWallSize,
  textureLevelSize, textureLevel1Index, textureLevel2Index, textureLevel3Index,
  textureEndSize, textureWinIndex, textureGameoverIndex,
  textureFloorIndex, textureFloorSize
) where

import Graphics.UI.Fungen

bmpList = [("Sprites/tex.bmp", Nothing),
            ("Sprites/wall.bmp", Nothing),
            ("Sprites/level1.bmp", magenta),
            ("Sprites/level2.bmp", magenta),
            ("Sprites/level3.bmp", magenta),
            ("Sprites/gameover.bmp", magenta),
            ("Sprites/win.bmp", magenta),
            ("Sprites/floor.bmp", magenta)]

textureWallIndex :: Int
textureWallIndex = 1

textureLevel1Index :: Int
textureLevel1Index = 2

textureLevel2Index :: Int
textureLevel2Index = 3

textureLevel3Index :: Int
textureLevel3Index = 4

textureGameoverIndex :: Int
textureGameoverIndex = 5

textureWinIndex :: Int
textureWinIndex = 6

textureFloorIndex :: Int
textureFloorIndex = 7

textureWallSize :: (Double, Double)
textureWallSize = (69, 491)

textureLevelSize :: (Double, Double)
textureLevelSize = (150, 50)

textureEndSize :: (Double, Double)
textureEndSize = (300, 100)

textureFloorSize :: (Double, Double)
textureFloorSize = (1024, 8)

magenta :: InvList
magenta = Just [(255,0,255)]
