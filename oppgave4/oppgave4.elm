(width, height) = (600, 400)
(halfWidth,halfHeight) = (width/2,height/2)

-- Model
-- Definer modellene her

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
main = display defaultGame