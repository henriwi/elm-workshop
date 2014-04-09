# Syntax

## Basics
Alle main-programmer har et main entry point

Funksjonen ```asText``` er en funksjon som returnerer en tekstlig representasjon av input

```
main = asText "Hello World!"
```

## Lister
```
main = asText [1,2,3]
```

```
main = asText (1 :: 2 :: 3 :: [])
```

## Records
En record er en datastruktur med "propertier"

```
main = asText { x=3, y=4 }
```

Oppdatering av Records

```
type Person = {name:String, age:Int}
henrik : Person
henrik = {name="Wingerei", age=27}

setAge : Person -> Int -> Person
setAge henrik a = {henrik | age <- a}

main = asText (setAge henrik 28)
```