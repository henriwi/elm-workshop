import Window
import Keyboard

-- Input

delta : Signal Time
delta = inSeconds <~ fps 35

type Input = { arrowX:Int, arrowY:Int, delta:Time }
input = sampleOn delta ( Input <~ lift .x Keyboard.arrows
                                ~ lift .y Keyboard.arrows
                                ~ delta)

-- Model
type Point = (Int,Int)
type Game = {pos:Point}

defaultGame : Game
defaultGame = { pos = (0,0) }


-- Update
stepGame : Input -> Game -> Game
stepGame {arrowX,arrowY,delta} game = { game | pos <- (arrowX,arrowY) }


-- Display
display : (Int,Int) -> Game -> Element
display (w,h) game = asText game



-- Main

game = foldp stepGame defaultGame input

main = lift2 display Window.dimensions game