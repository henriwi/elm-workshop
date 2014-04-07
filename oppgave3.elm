import Keyboard

(width,height) = (600,400)
(halfWidth,halfHeight) = (width/2,height/2)

display {x,y} = collage 800 800 [
  rect width height |> filled black, 
  rect 80 10 |> filled red |> move (toFloat x*100, -halfHeight+10),
  circle 8 |> filled white |> move (0,halfHeight-8)]

main = lift display Keyboard.arrows