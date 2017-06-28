module ObstacleManager(
  createWalls,
  obstacleManagerCycle, createFloor
) where

import Graphics.UI.Fungen
import Types
import Variables
import Textures
import Wall

wall0Speed = -10
wall0Hole = 100
minWallY = 100;
maxWallY = fromIntegral((snd windowResolution) - 100)

createFloor :: [FBirdObject]
createFloor = let sprite = Tex textureFloorSize textureFloorIndex
              in [(object "bottomFloor" sprite False (floorBottomPosition) (0,0) ()),
                  (object "upperFloor" sprite False floorUpperPosition (0,0) ())]

createWalls :: [FBirdObject]
createWalls = let sprite = Tex textureWallSize textureWallIndex
              in [(object "wall01" sprite False (768, (wallFindUpPosition ((snd windowResolution)`div`2) wall0Hole)) (wall0Speed,0) ()),
                 (object "wall02" sprite False (768, (wallFindDownPosition ((snd windowResolution)`div`2) wall0Hole)) (wall0Speed, 0) ())]

obstacleManagerCycle :: FBirdAction ()
obstacleManagerCycle = do
  gs <- getGameState
  case gs of
    Level n -> do upWall <- findObject ("wall"++show(n)++"1") "walls"
                  downWall <- findObject ("wall"++show(n)++"2") "walls"
                  (ux, uy) <- getObjectPosition upWall
                  (dx, dy) <- getObjectPosition downWall
                  when (wallOffScreen ux) (do
                    setObjectPosition (wallRightmostPosition, (wallFindUpPosition ((snd windowResolution)`div`2) wall0Hole)) upWall
                    setObjectPosition (wallRightmostPosition, (wallFindDownPosition ((snd windowResolution)`div`2) wall0Hole)) downWall
                                          )
    GameOver -> do return()
