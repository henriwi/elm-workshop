import Window
import Keyboard

shipSize = 20
enemySize = 15
(width, height) = (600, 400)
(halfWidth,halfHeight) = (width/2,height/2)

-- Input
delta : Signal Time
delta = inSeconds <~ fps 25

type Input = { arrowX:Int, arrowY:Int, delta:Time }
input = sampleOn delta ( Input <~ lift .x Keyboard.arrows
                                ~ lift .y Keyboard.arrows
                                ~ delta)

-- Model
type Pos = (Float,Float)

type Game = {ship:Ship,enemy:Enemy}

defaultGame : Game
defaultGame = {ship = defaultShip,enemy=defaultEnemy}

type Ship = {x:Float, y:Float}

defaultShip : Ship
defaultShip = {x = 0,y = (-halfHeight + shipSize)}

type Enemy = {pos:Pos, vel:Float}
defaultEnemy = {pos=(0,halfHeight),vel=0}

type 

-- Update
stepGame : Input -> Game -> Game
stepGame input game = { game | ship <- stepShip input game.ship,
                               enemy <- stepEnemy game.enemy}

stepShip : Input -> Ship -> Ship
stepShip {arrowX, arrowY} ship = {ship | x <- clamp (-halfWidth) (halfHeight) (ship.x + toFloat arrowX * 2)}

stepEnemy : Enemy -> Enemy
stepEnemy e = {e | pos <- addVel e.pos e.vel,
                   vel <- if | snd e.pos < (-halfHeight+enemySize) -> 0
                             | otherwise                           -> -2}

addVel (ax,ay) vel = (ax, ay + vel)                   


-- Display
display : (Int,Int) -> Game -> Element
display (w, h) game = 
  let drawBackground = rect width height |> filled grey
      drawShip ship  = square shipSize |> filled red |> move (ship.x, ship.y)
      drawEnemy enemy = square enemySize |> filled blue |> move (enemy.pos)
  in collage w h [ 
                    drawBackground, 
                    drawShip game.ship,
                    drawEnemy game.enemy
                 ]

--display (w,h) game = asText game

-- Main

game = foldp stepGame defaultGame input

main = lift2 display Window.dimensions game