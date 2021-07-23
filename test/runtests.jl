using PokeTypes
using Test

const TEST_TYPES = [Normal(), Fire(), Water(),
                    Electric(), Grass(), Ice(),
                    Fighting(), Poison(), Ground()]

const TEST_TABLE = reshape([1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
                            1.0, 0.5, 0.5, 1.0, 2.0, 2.0, 1.0, 1.0, 1.0,
                            1.0, 2.0, 0.5, 1.0, 0.5, 1.0, 1.0, 1.0, 2.0,
                            1.0, 1.0, 2.0, 0.5, 0.5, 1.0, 1.0, 1.0, 0.0,
                            1.0, 0.5, 2.0, 1.0, 0.5, 1.0, 1.0, 0.5, 2.0,
                            1.0, 1.0, 0.5, 1.0, 2.0, 0.5, 1.0, 1.0, 1.0,
                            2.0, 1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 0.5, 1.0,
                            1.0, 1.0, 1.0, 1.0, 2.0, 1.0, 1.0, 0.5, 0.5,
                            1.0, 2.0, 1.0, 2.0, 0.5, 1.0, 1.0, 2.0, 1.0],
                           9,9)

for (y,atk_type) in enumerate(TEST_TYPES)
    for (x,def_type) in enumerate(TEST_TYPES)
        expected = TEST_TABLE[x,y]
        actual = eff(atk_type, def_type)
        println("Testing $(typeof(atk_type)) vs $(typeof(def_type)). Expected: $expected, Actual: $actual")
        @test expected == actual
    end
end