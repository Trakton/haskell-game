module Textures (
  bmpList,
  texturePlayerSize, texturePlayerIndex,
  textureWallIndex, textureWallSize,textureWall2Index,
  textureFloorIndex, textureFloorSize, textureCeilIndex,
  textureMapIndex, textureMapSize
) where

import Graphics.UI.Fungen

bmpList = [("Sprites/tex.bmp", black),
            ("Sprites/wall.bmp", black),
            ("Sprites/floor.bmp", magenta),
            ("Sprites/ceil.bmp", magenta),
            ("Sprites/wall2.bmp", black),
            ("Sprites/player.bmp", black)]

textureMapIndex :: Int
textureMapIndex = 0

textureWallIndex :: Int
textureWallIndex = 1

textureFloorIndex :: Int
textureFloorIndex = 2

textureCeilIndex :: Int
textureCeilIndex = 3

textureWall2Index :: Int
textureWall2Index = 4

texturePlayerIndex :: Int
texturePlayerIndex = 5

textureWallSize :: (Double, Double)
textureWallSize = (69, 491)

textureFloorSize :: (Double, Double)
textureFloorSize = (1024, 24)

texturePlayerSize :: (Double, Double)
texturePlayerSize = (40, 30)

textureMapSize :: (Double, Double)
textureMapSize = (341, 615)

magenta :: InvList
magenta = Just [(255,0,255)]

black :: InvList
black = Just [(0,0,0)]
