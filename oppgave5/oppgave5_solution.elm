import Keyboard

(width, height) = (600, 400)
(halfWidth,halfHeight) = (width/2,height/2)

-- Input
delta : Signal Time
delta = inSeconds <~ fps 25

type Input = {arrowX:Int}
input = sampleOn delta ( Input <~ lift .x Keyboard.arrows)

-- Model
type Game = {paddle:Paddle,ball:Ball}

defaultGame : Game
defaultGame = {paddle = defaultPaddle, ball = defaultBall}

-- Lag Paddle og Ball
type Paddle = {x:Float, y:Float}

defaultPaddle : Paddle
defaultPaddle = {x = 0, y = (-halfHeight + 10)}

type Ball = {x:Float, y:Float, vx:Float, vy:Float}
defaultBall = {x=0, y=halfHeight, vx=0, vy=0}

-- Update
stepGame : Input -> Game -> Game
stepGame input game = { game | paddle <- stepPaddle input game.paddle,
                               ball <- stepBall game.paddle game.ball}

stepPaddle : Input -> Paddle -> Paddle
stepPaddle {arrowX} paddle = {paddle | x <- clamp (-halfWidth+40) (halfWidth-40) (paddle.x + toFloat arrowX * 10)}

stepBall : Paddle -> Ball -> Ball
stepBall p b = {b | x  <- b.x + b.vx,
                    y  <- b.y + b.vy,
                    vx <- -(p.x+40-(b.x+4))*0.01,
                    vy <- if | within (p.x,p.y) (b.x,b.y) 40       -> 10
                             | within (0,halfHeight) (b.x,b.y) 300 -> -10
                             | otherwise                           -> b.vy}

within (ax, ay) (bx, by) rangeX = (ax |> near bx rangeX)
                  && (ay |> near by 25)
near k c n = n >= k - c && n <= k + c

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