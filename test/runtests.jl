using pptools
using Test
using TestItems
using TestItemRunner

# Note the use of @testitem macro rather than @testset (better integration with VSCode)
# https://www.julia-vscode.org/docs/stable/userguide/testitems/
@testitem "pptools.jl" begin
    # Write your tests here.
    @assert pptools.hi() == "Hello World!"
    @assert pptools.bye() == "Bye for now"
    @assert pptools.foobar() == "foo"
    @assert pptools.foobar(foo=false) == "bar"
    @assert pptools.hello("Alice", verbose=false) == "Hello, Alice!"
end
