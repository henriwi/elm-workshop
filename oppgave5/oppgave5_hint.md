# Står du fast?
```stepGame```-funksjonen ser slik ut:

```
stepGame : Input -> Game -> Game
stepGame input game = { game | paddle <- stepPaddle input game.paddle,
                               ball <- stepBall game.paddle game.ball}
```

## Fortsatt fast?
```stepPaddle```-funksjonen ser slik ut:

```
stepPaddle : Input -> Paddle -> Paddle
stepPaddle {arrowX} paddle = {paddle | x <- clamp (-halfWidth+40) (halfWidth-40) (paddle.x + toFloat arrowX * 10)}
```

## Helt fast?
Se på løsningen :)