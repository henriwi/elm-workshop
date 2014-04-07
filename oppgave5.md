# Oppgave 3
Nå skal du endelig få ting til å flytte på seg!

Definer følgende kode øverst i programmet ditt. Den sørger for å sette opp all inputen korrekt.

```
import Keyobard
-- Input
delta : Signal Time
delta = inSeconds <~ fps 25

type Input = { arrowX:Int, arrowY:Int, delta:Time }
input = sampleOn delta ( Input <~ lift .x Keyboard.arrows
                                ~ lift .y Keyboard.arrows
                                ~ delta)
```