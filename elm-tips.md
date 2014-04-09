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

## Typer
En record kan også ha en type-definisjon
```
type Person = {name:String, age:Int}
henrik : Person
henrik = {name="Wingerei", age=27}

main = asText henrik
```


### Oppdatering av Records

```
type Person = {name:String, age:Int}
henrik : Person
henrik = {name="Wingerei", age=27}

updatePerson : Person -> Int -> String -> Person
updatePerson henrik age name = {henrik | age <- age,
                                       name <- name}

main = asText (updatePerson henrik 28 "Olsen")
```

### Mer oppdatering av record
```
type Person = {name:String, age:Int}
henrik : Person
henrik = {name="Wingerei", age=27}

updatePerson : Person -> Int -> String -> Person
updatePerson henrik age name = {henrik | age <- if | age < 30 -> age
                                              | otherwise -> 30,
                                    name <- name}

main = asText (updatePerson henrik 40 "Olsen")
``