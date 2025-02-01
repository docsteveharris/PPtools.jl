using pptools
using Test
using TestItems
using TestItemRunner

@testset verbose = true "pptools.jl" begin
    # Write your tests here.
    @assert pptools.hi() == "Hello World!"
    @assert pptools.bye() == "Bye for now"
    @assert pptools.foo() == "bar"
    @assert pptools.hello("Alice", verbose=false) == "Hello, Alice!"
end
