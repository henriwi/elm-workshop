import Window
import Keyboard
import Random

shipSize = 20
(width, height) = (600, 400)

-- Input
delta : Signal Time
delta = inSeconds <~ fps 25

type Input = { arrowX:Int, arrowY:Int, delta:Time, rand:Int }
input = sampleOn delta ( Input <~ lift .x Keyboard.arrows
                                ~ lift .y Keyboard.arrows
                                ~ delta
                                ~ Random.range 0 200 (fps 1))

-- Model
type Pos = (Float, Float)

type Game = {ship:Ship, enemies:Pos}

defaultGame : Game
defaultGame = {ship = defaultShip, enemies=(0,0)}

type Ship = {x:Float, y:Float}

defaultShip : Ship
defaultShip = {x = 0,y = (-height/2 + shipSize)}


-- Update
stepGame : Input -> Game -> Game
stepGame input game = { game | ship <- stepShip input game.ship,
                               enemies <- stepEnemies input.rand }

stepShip : Input -> Ship -> Ship
stepShip {arrowX, arrowY} ship = {ship | x <- clamp (-width/2) (height/2) (ship.x + toFloat arrowX * 2)}

stepEnemies : Int -> Pos
stepEnemies f = (toFloat f,toFloat f)


-- Display
display : (Int,Int) -> Game -> Element
display (w, h) game = 
  let drawBackground = rect width height |> filled grey
      drawShip ship  = rect shipSize shipSize |> filled red |> move (ship.x, ship.y)
      drawEnemies enemies = square 10 |> filled blue |> move enemies
  in collage w h [ 
                    drawBackground, 
                    drawShip game.ship,
                    drawEnemies game.enemies
                 ]


-- Main

game = foldp stepGame defaultGame input

main = lift2 display Window.dimensions game