# Oppgave 5

I siste oppgaven skal vi fullføre vårt lille spill.

Nå som vi både har modeller og display-koden på plass, trenger vi to elementer til. Det er kode som håndterer de ulike input-parametrene vi skal ha, samt kode som oppdaterer modellene våre basert på inputen. Etterhvert som du jobber med programmet, så legg merke til at koden som tegner grafikken til spillet vårt ikke trenger å endres noe. Grafikken vil automatisk rendres på nytt når modellene våre for nye verdier.

## Input
Følgende kodeblokk definerer inputen til programmet vårt. Det inneholder piltastene ```arrowX``` og ```arrowY```.

```
-- Input
delta : Signal Time
delta = inSeconds <~ fps 25

type Input = { arrowX:Int, arrowY:Int}
input = sampleOn delta ( Input <~ lift .x Keyboard.arrows
                                ~ lift .y Keyboard.arrows)
```

## Step functions
I Elm kalles funksjonene som oppdaterer modellene basert på input for ```step```-functions. Disse funksjonene tar typisk to ting som input, ```Input``` og modellen som skal oppdateres, og returnerer en ny, oppdatert modell. I vårt spill trenger vi tre slike ```step```-functions: ```stepGame```, ```stepPaddle``` og ```stepBall```.

### stepGame
```stepGame``` har følgende definisjon:
```
stepGame : Input -> Game -> Game
```

Denne funksjonen skal så oppdatere ```paddle``` og ```ball``` ved å kalle dens respektive step-funksjoner.

### stepPaddle
```stepPaddle``` har følgende definisjon:

```
stepPaddle : Input -> Paddle -> Paddle
```

Denne funksjonen skal øke x-posisjonen til paddle med verdien til ```arrowX``` som ligger lagret i Input. Prøv å få paddlen til å ikke å lenger enn bredden på spillet. Du kan bruke ```clamp```-funksjonen til dette.

### stepBall
```stepBall``` har følgende definisjon:

```
stepBall : Paddle -> Ball -> Ball
```

Denne funksjonen skal oppdatere posisjonen til ballen (```x``` og ```y```) til den nåværende retningen til ballen (```vx``` og ```vy```). 

I tillegg skal den oppdatere den nye retningen til ballen. Den skal skifte retning hvis den er i nærheten av paddlen, eller toppen av brettet. Her kan du bruke hjelpefunksjonen ```within``` til å finne ut om retningen skal snus. Denne tar inn to posisjoner og en avstand, og returnerer ```True``` hvis posisjonene er i nærheten av hverandre, ```False``` hvis ikke.

```
within (ax, ay) (bx, by) rangeX = (ax |> near bx rangeX) && (ay |> near by 25)
near k c n = n >= k - c && n <= k + c

## Ferdig?
Hvis du er ferdig, eller vil jobbe videre på spillet, så er dette noen ideer til hva du kan jobbe videre med:
- Poengsum
- Legg til funksjonalitet for å kunne starte spillet på nytt
```