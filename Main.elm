import Window
import Keyboard

-- Input

delta : Signal Time
delta = inSeconds <~ fps 25

type Input = { arrowX:Int, arrowY:Int, delta:Time }
input = sampleOn delta ( Input <~ lift .x Keyboard.arrows
                                ~ lift .y Keyboard.arrows
                                ~ delta)

-- Model
type Game = {x:Float, y:Float}

defaultGame : Game
defaultGame = { x = 0, y = 0 }


-- Update
stepGame : Input -> Game -> Game
stepGame {arrowX, arrowY, delta} game = { game | x <- game.x + toFloat arrowX * 2,
                                                 y <- game.y + toFloat arrowY * 2 
                                        }


-- Display
display : (Int,Int) -> Game -> Element
display (w, h) game = collage w h [ square 40 |> filled red |> move (game.x, game.y) ]


-- Main

game = foldp stepGame defaultGame input

main = lift2 display Window.dimensions game