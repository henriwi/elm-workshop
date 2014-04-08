import Keyboard

display : {x:Int,y:Int} -> Element
display {x,y} = collage 800 800 
                 [rect 80 10 |> filled red |> move (toFloat x*100, toFloat y*100)]

main = lift display Keyboard.arrows