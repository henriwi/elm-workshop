# Oppgave 2

For å kunne få til spill som beveger seg i Elm trenger vi noe som holder på dataene våre. Dette bruker vi modeller til.

Målet er å tegne det samme som i stad, men å bruke modeller til å sette posisjonen på de ulike elementene, istedenfor hardkodede verdier.

Når dette er på plass vil det være mye enklere å få objektene til å bevege seg.

## Tips
Du skal lage to records (paddle og ball). Paddle må inneholde x og y (posisjonen til åren), mens ballen må ha en x,y og vx og vy (for hvilken retning ballen har).

Videre skal du gjenbruke display-funksjonen din fra i sted. Den må utvides til å ta inn en game-record, og bruk så denne recorden til å flytte de ulike elementene rundt.

## Start med dette
```
import Keyboard
(width, height) = (600, 400)
(halfWidth,halfHeight) = (width/2,height/2)

-- Model
type Game = {paddle:Paddle,ball:Ball}

defaultGame : Game
defaultGame = {paddle = defaultPaddle, ball = defaultBall}

-- Lag Paddle og Ball

-- Display
-- Gjenbruk display-funksjonen fra forrige steg
-- Første tuppel er bredde/høyde, så selve gamet (defaultGame i dette tilfellet).
-- Skal returnere et collage

display : Game -> Element

-- Main
-- Så kaller vi display-funksjonen med default-game til slutt

main = display defaultGame
```