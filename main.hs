module Main where
import Graphics.UI.Fungen

data GameAttribute = Score Int

type PongObject = GameObject ()
type PongAction a = IOGame GameAttribute () () () a

createBall :: PongObject
createBall = let ballPic = Basic(Circle 3.0 0.0 1.0 0.0 Filled)
             in object "ball" ballPic False (125,125) (-5,5) ()

createBar :: PongObject
createBar = let barBound = [(-25, -6), (25,-6), (25,6), (-25,6)]
                barPic = Basic(Polyg barBound 1.0 1.0 1.0 Unfilled)
            in object "bar" barPic False (125,30) (0,0) ()

moveBarToRight :: Modifiers -> Position -> PongAction ()
moveBarToRight _ _ = do
  obj <- findObject "bar" "barGroup"
  (pX,pY) <- getObjectPosition obj
  (sX,_) <- getObjectSize obj
  if(pX + (sX/2) + 5 <= 250) then
    setObjectPosition (pX+5,pY) obj
  else
    setObjectPosition ((250-(sX/2)), pY) obj

moveBarToLeft :: Modifiers -> Position -> PongAction ()
moveBarToLeft _ _ = do
  obj <- findObject "bar" "barGroup"
  (pX,pY) <- getObjectPosition obj
  (sX,_) <- getObjectSize obj
  if(pX +(sX/2) - 5 >= 0) then
    setObjectPosition (pX-5, pY) obj
  else
    setObjectPosition (sX/2, pY) obj

gameCycle :: PongAction ()
gameCycle = do
  (Score n) <- getGameAttribute
  printOnScreen (show n) TimesRoman24 (0,0) 1.0 1.0 1.0

main :: IO()
main = do
  let winConfig =((0,0),(250,250), "Test")
      bmpList = [("tex.bmp", Nothing)]
      gameMap = textureMap 0 50 50 250.0 250.0
      bar = objectGroup "barGroup" [createBar]
      ball = objectGroup "ballGroup" [createBall]
      initScore = Score 0
      input = [(SpecialKey KeyRight, StillDown, moveBarToRight),
               (SpecialKey KeyLeft, StillDown, moveBarToLeft)]
  funInit winConfig gameMap [bar,ball] () initScore input gameCycle (Timer 40) bmpList
