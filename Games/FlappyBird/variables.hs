module Variables (
  windowResolution,
  gravity, middleScreen, createMsgs
) where

import Graphics.UI.Fungen
import Textures
import Types

createMsgs :: [FBirdObject]
createMsgs = let level1Sprite = Tex textureLevelSize textureLevel1Index
                 level2Sprite = Tex textureLevelSize textureLevel2Index
                 level3Sprite = Tex textureLevelSize textureLevel3Index
                 winSprite = Tex textureEndSize textureWinIndex
                 gameoverSprite = Tex textureEndSize textureGameoverIndex
             in [(object "level1" level1Sprite True middleScreen (0,0) ()),
                 (object "level2" level2Sprite True middleScreen (0,0) ()),
                 (object "level3" level3Sprite True middleScreen (0,0) ()),
                 (object "win" winSprite True middleScreen (0,0) ()),
                 (object "gameover" gameoverSprite True middleScreen (0,0) ())]

windowResolution :: (Int, Int)
windowResolution = (1024, 615)

middleScreen :: (Double, Double)
middleScreen = (fromIntegral((fst windowResolution)`div`2), fromIntegral((fst windowResolution)`div`2))

gravity :: Double
gravity = 0.75
