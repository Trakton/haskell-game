module Wall(
  wallFindUpPosition,
  wallFindDownPosition
) where

import Textures

wallFindUpPosition :: Int -> Int -> Double
wallFindUpPosition center hole = fromIntegral (center + ((round (snd textureWallSize)`div`2)) + (hole`div`2))

wallFindDownPosition :: Int -> Int -> Double
wallFindDownPosition center hole = fromIntegral (center - ((round (snd textureWallSize))`div`2) - (hole`div`2))
