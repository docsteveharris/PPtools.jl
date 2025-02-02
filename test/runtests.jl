using PPtools
using Test
using TestItems
using TestItemRunner

# Note the use of @testitem macro rather than @testset (better integration with VSCode)
# https://www.julia-vscode.org/docs/stable/userguide/testitems/
@testitem "my pptools" begin
    # Write your tests here.
    @assert PPtools.hi() == "Hello World!"
    @assert PPtools.bye() == "Bye for now"
end

@testitem "my utils" begin
    # Test the number_to_text function
    @assert number_to_text(1.0) == "1"
    @assert number_to_text(3.14e3) == "3140"
    @assert number_to_text(3.14) == "3.14"
    @assert number_to_text(123456789e9) == "123456789000000000"

    @assert PPtools.utils.foobar() == "foo"
    @assert PPtools.utils.foobar(foo=false) == "bar"
    @assert PPtools.hello("Alice", verbose=false) == "Hello, Alice!"
end