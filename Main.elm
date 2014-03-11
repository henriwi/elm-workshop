import Window
import Keyboard

shipSize = 20
(width, height) = (600, 400)

-- Input
delta : Signal Time
delta = inSeconds <~ fps 25

type Input = { arrowX:Int, arrowY:Int, delta:Time }
input = sampleOn delta ( Input <~ lift .x Keyboard.arrows
                                ~ lift .y Keyboard.arrows
                                ~ delta)

-- Model
type Game = {ship:Ship}

defaultGame : Game
defaultGame = {ship = defaultShip}

type Ship = {x:Float, y:Float}

defaultShip : Ship
defaultShip = {x = 0,y = (-height/2 + shipSize)}


-- Update
stepGame : Input -> Game -> Game
stepGame input game = { game | ship <- stepShip input game.ship}

stepShip : Input -> Ship -> Ship
stepShip {arrowX, arrowY} ship = {ship | x <- clamp (-width/2) (height/2) (ship.x + toFloat arrowX * 2)}


-- Display
display : (Int,Int) -> Game -> Element
display (w, h) game = 
  let drawBackground = rect width height |> filled grey
      drawShip ship  = rect shipSize shipSize |> filled red |> move (ship.x, ship.y)
  in collage w h [ 
                    drawBackground, 
                    drawShip game.ship
                 ]


-- Main

game = foldp stepGame defaultGame input

main = lift2 display Window.dimensions game