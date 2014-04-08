import Keyboard

(width, height) = (600, 400)
(halfWidth,halfHeight) = (width/2,height/2)

-- Input
-- Definer input her

-- Model
type Game = {paddle:Paddle,ball:Ball}

defaultGame : Game
defaultGame = {paddle = defaultPaddle, ball = defaultBall}

type Paddle = {x:Float, y:Float}

defaultPaddle : Paddle
defaultPaddle = {x = 0, y = (-halfHeight + 10)}

type Ball = {x:Float, y:Float, vx:Float, vy:Float}
defaultBall = {x=0, y=halfHeight, vx=0, vy=0}

-- Update
-- Definer step-functions her

-- Display
display : Game -> Element
display game = 
  let drawBackground      = rect width height |> filled black
      drawPaddle paddle   = rect 80 10 |> filled red |> move (paddle.x, paddle.y)
      drawBall ball       = circle 8 |> filled white |> move (ball.x, ball.y)
  in collage 800 800 [ 
                    drawBackground, 
                    drawBall game.ball,
                    drawPaddle game.paddle
                 ]

-- Main
game = foldp stepGame defaultGame input
main = lift display game