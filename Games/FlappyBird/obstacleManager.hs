module ObstacleManager(
  createWalls
) where

import Graphics.UI.Fungen
import Types
import Variables
import Textures
import Wall

wall0Speed = -10
wall0Hole = 100

createWalls :: [FBirdObject]
createWalls = let sprite = Tex textureWallSize textureWallIndex
              in [(object "wall01" sprite False (768, (wallFindUpPosition ((snd windowResolution)`div`2) wall0Hole)) (wall0Speed,0) ()),
                 (object "wall02" sprite False (768, (wallFindDownPosition ((snd windowResolution)`div`2) wall0Hole)) (wall0Speed, 0) ())]
