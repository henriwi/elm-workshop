# Oppgave 4

For å kunne få til spill som beveger seg i Elm trenger vi noe som holder på dataene våre. Dette bruker vi modeller til.

Målet er å tegne det samme som i sted, men bruke modeller til å sette posisjonen på de ulike elementene istedenfor hardkodede verdier. Når dette er på plass vil det være mye enklere å få objektene til å bevege seg som vi vil i neste og siste oppgave.

I koden vi skal bruke som utgangspunkt har jeg gjort litt om på display-koden vår, ved blant annet å bruke ```let```-operatoren til å definere et par hjelpefunksjoner som tegner de ulike elementene våre. I tillegg tar ```display```-funksjonen nå inn en ```game```-record istedenfor signalet ```Keyboard.arrows```. Deretter bruker vi modellen i ```display```-funksjonen til å flytte elementene våre til korrekt sted.

- Vi trenger tre modeller. ```Game```, ```Paddle``` og ```Ball```.
- ```Game``` skal ha to propertier ```paddle``` og ```ball```
- ```Paddle``` skal ha to propertier ```x``` og ```y```, begge av typen ```Float```. Dette holder på posisjonen til ```Paddle```
- ```Ball``` skal ha fire propertier ```x```, ```y```, ```vx``` og ```vy```. ```x``` og ```y``` holder på posisjonen til ballen, mens ```vx``` og ```vy``` holder på den nåværende retningen til ballen. Alle disse skal være av typen ```Float```
- Til slutt må det defineres tre default-records, en for hver type (```defaultGame```, ```defaultPaddle``` og ```defaultGame```). Verdiene til disse default-modellene skal være de verdiene vi ønsker at elementene skal ha som utgangsposisjon (samme verdier som i oppgave 3).