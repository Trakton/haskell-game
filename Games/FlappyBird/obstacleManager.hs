module ObstacleManager(
  createWalls,
  obstacleManagerCycle, createFloor
) where

import Graphics.UI.Fungen
import Types
import Variables
import Textures
import Wall

wall1Speed = -10
wall1Hole = 100
minWallY = 100;
maxWallY = fromIntegral((snd windowResolution) - 100)

createFloor :: [FBirdObject]
createFloor = let sprite = Tex textureFloorSize textureFloorIndex
              in [(object "bottomFloor" sprite False (floorBottomPosition) (0,0) ()),
                  (object "upperFloor" sprite False floorUpperPosition (0,0) ())]

createWalls :: [FBirdObject]
createWalls = let sprite = Tex textureWallSize textureWallIndex
              in [(object "wall11" sprite False (wallRightmostPosition, (wallFindUpPosition ((snd windowResolution)`div`2) wall1Hole)) (wall1Speed,0) ()),
                 (object "wall12" sprite False (wallRightmostPosition, (wallFindDownPosition ((snd windowResolution)`div`2) wall1Hole)) (wall1Speed, 0) ())]

obstacleManagerCycle :: FBirdAction ()
obstacleManagerCycle = do
  gs <- getGameState
  case gs of
    LevelStart n -> do upWall <- findObject ("wall"++show(n)++"1") "walls"
                       downWall <- findObject ("wall"++show(n)++"2") "walls"
                       setObjectAsleep True upWall
                       setObjectAsleep True downWall
    Level n -> do upWall <- findObject ("wall"++show(n)++"1") "walls"
                  downWall <- findObject ("wall"++show(n)++"2") "walls"
                  setObjectAsleep False upWall
                  setObjectAsleep False downWall
                  (ux, uy) <- getObjectPosition upWall
                  (dx, dy) <- getObjectPosition downWall
                  when (wallOffScreen ux) (do
                    (GA score lastWallY) <- getGameAttribute
                    let newY = ((lastWallY+(4*((snd windowResolution)`div`3)))`mod`(maxWallY-minWallY))+minWallY
                    setObjectPosition (wallRightmostPosition, (wallFindUpPosition newY wall1Hole)) upWall
                    setObjectPosition (wallRightmostPosition, (wallFindDownPosition newY wall1Hole)) downWall
                    setGameAttribute (GA (score+1) newY)
                                          )
    GameOver -> do return()
    Win -> do return()
