module Main where
import Graphics.UI.Fungen

data GameAttribute = Score Int

type FBirdObject = GameObject ()
type FBirdAction a = IOGame GameAttribute () () () a

createBird :: FBirdObject
createBird = let birdSprite = Basic(Circle 7.5 0.0 1.0 0.0 Filled)
             in object "bird" birdSprite False (125, 125) (0, 0) ()

gameCycle :: FBirdAction ()
gameCycle = do
  applyGravity

fly :: Modifiers -> Position -> FBirdAction ()
fly _ _ = do
  bird <- findObject "bird" "birdGroup"
  setObjectSpeed (0, 7.5) bird

applyGravity :: FBirdAction ()
applyGravity = do
  bird <- findObject "bird" "birdGroup"
  (x, y) <- getObjectSpeed bird
  when (y > -7.5) (do setObjectSpeed (x, (y-0.75)) bird)

main :: IO()
main = do
  let winConfig = ((0,0), (480, 320), "Flappy Bird")
      bmpList = [("tex.bmp", Nothing)]
      gameMap = textureMap 0 50 50 250.0 250.0
      bird = objectGroup "birdGroup" [createBird]
      input = [(SpecialKey KeyUp, Press, fly)]
      initScore = Score 0
  funInit winConfig gameMap [bird] () initScore input gameCycle (Timer 40) bmpList
