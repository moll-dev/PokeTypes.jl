module PokeTypes

greet() = print("Hello World!")

const NO_EFFECT = 0.0
const NOT_VERY_EFFECTIVE = 0.5
const NORMAL_EFFECTIVE = 1.0
const SUPER_EFFECTIVE = 2.0

# Defining our type hierarchy
abstract type PokéType end
struct Normal <: PokéType end
struct Fire     <: PokéType end
struct Water    <: PokéType end
struct Electric <: PokéType end
struct Grass    <: PokéType end
struct Ice      <: PokéType end
struct Fighting <: PokéType end
struct Poison   <: PokéType end
struct Ground   <: PokéType end


# Defining all of the self-to-self attacks
eff(atk::T1, def::T2) where {T1 <: PokéType, T2 <: PokéType} = NORMAL_EFFECTIVE
eff(atk::T, def::T) where {T <: PokéType} = NOT_VERY_EFFECTIVE
eff(atk::Fighting, def::Fighting)         = NORMAL_EFFECTIVE
eff(atk::Ground,   def::Ground)           = NORMAL_EFFECTIVE
eff(atk::Normal,   def::Normal)           = NORMAL_EFFECTIVE

# SUPER_EFFECTIVE Attacks
eff(atk::Fire,     def::Grass)    = SUPER_EFFECTIVE
eff(atk::Fire,     def::Ice)      = SUPER_EFFECTIVE
eff(atk::Water,    def::Fire)     = SUPER_EFFECTIVE
eff(atk::Water,    def::Ground)   = SUPER_EFFECTIVE
eff(atk::Electric, def::Water)    = SUPER_EFFECTIVE
eff(atk::Ground,   def::Poison)   = SUPER_EFFECTIVE
eff(atk::Ground,   def::Fire)     = SUPER_EFFECTIVE
eff(atk::Grass,    def::Water)    = SUPER_EFFECTIVE
eff(atk::Grass,    def::Ground)   = SUPER_EFFECTIVE
eff(atk::Ice,      def::Grass)    = SUPER_EFFECTIVE
eff(atk::Fighting, def::Normal)   = SUPER_EFFECTIVE
eff(atk::Fighting, def::Ice)      = SUPER_EFFECTIVE
eff(atk::Poison,   def::Grass)    = SUPER_EFFECTIVE
eff(atk::Ground,   def::Electric) = SUPER_EFFECTIVE

# NOT_VERY_EFFECTIVE Attacks
eff(atk::Fire,     def::Water)  = NOT_VERY_EFFECTIVE
eff(atk::Water,    def::Grass)  = NOT_VERY_EFFECTIVE
eff(atk::Electric, def::Grass)  = NOT_VERY_EFFECTIVE
eff(atk::Grass,    def::Fire)   = NOT_VERY_EFFECTIVE
eff(atk::Grass,    def::Poison) = NOT_VERY_EFFECTIVE
eff(atk::Ice,      def::Water)  = NOT_VERY_EFFECTIVE
eff(atk::Fighting, def::Poison) = NOT_VERY_EFFECTIVE
eff(atk::Poison,   def::Ground) = NOT_VERY_EFFECTIVE
eff(atk::Ground,   def::Grass)  = NOT_VERY_EFFECTIVE

# NO_EFFECT Attacks
eff(atk::Electric, def::Ground) = NO_EFFECT

# Package Export stuff
export PokéType, Normal, Fire, Water, Electric, Grass, Ice, Fighting, Poison, Ground
export eff, attack

function attack(atk::PokéType, def::PokéType)
    effectiveness = eff(atk, def)
    eff_str = eff_string(effectiveness)
    println("A Pokémon used a $(typeof(atk)) attack against a $(typeof(def)) Pokémon, it was $eff_str")
end

function eff_string(effectiveness)
    if effectiveness == NO_EFFECT
        return "not effective at all!"
    elseif effectiveness == NOT_VERY_EFFECTIVE
        return "not very effective..."
    elseif effectiveness == NORMAL_EFFECTIVE
        return "normally effective."
    elseif effectiveness == SUPER_EFFECTIVE
        return "super effective!!!"
    else
        return "??????"
    end
end

    
end # module
