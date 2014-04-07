# Oppgave 1

I denne første oppgaven skal du bruke Elm til å tegne grafikken til spillet vårt.

Resultatet skal se slik ut:



## Tips
Bruk ```collage``` som tar en høyde, bredde og en liste med elementer du vil tegne.

Bruke ```rect``` for å tegne rektangel, og ```circle``` for å tegne sirkelen.


## Står du fast?
Ta en titt på løsningen her: 


## Start med dette
```
(width,height) = (600,400)
(halfWidth,halfHeight) = (width/2,height/2)

display : Element
display = collage 800 800 []

main = display
```
