# Julia-Poke-Dispatch
Code for ["Julia used Multiple Dispatch! It was Super Effective!"](https://www.moll.dev/projects/effective-multi-dispatch/) article.

I decided to write a small package for people to play with. Enjoy!

Usage:
```julia
using PokeTypes
import PokeTypes.eff

type MyNewPokeType <: PokéType end

eff(atk::MyNewPokeType, def::Water) = PokeTypes.NOT_VERY_EFFECTIVE

PokeTypes.attack(MyNewPokeType(), Water())
```


![CC BY-NC 3.0](https://licensebuttons.net/l/by-nc/4.0/88x31.png)
Illustrations in this repository are licensed under a [Creative Commons Attribution-NonCommercial 4.0 International License](http://creativecommons.org/licenses/by-nc/4.0/)