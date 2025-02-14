using PPtools
using Test
using TestItems
using TestItemRunner
using PPtools.utils

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

@testitem "my read_sql_script" begin
    # Test the read_sql_script function
    # Note: this is a basic test and does not cover all edge cases
    # For example, it does not test the remove_comments and split_statements options
    # It also does not test the error handling
    # It is recommended to write more comprehensive tests for production code
    test2_txt = """SELECT * FROM users;
    UPDATE users SET status = 'active';"""

    @test read_sql_script("./data/test1.sql") == "SELECT * FROM table"
    @test read_sql_script("./data/test2.sql"; remove_comments=true) == test2_txt
end

@testitem "my sqlite_datetime_to_date" begin
    # Test the sqlite_datetime_to_date function
    using Dates
    # Basic ⁠DateTime is timezone-naive. If you need timezone awareness, you
    # should use the ⁠TimeZones.jl package
    @assert sqlite_datetime_to_date("2021-01-01 12:00:00") == DateTime(2021, 1, 1, 12, 0, 0)
end

@testitem "Check Concept Codes" begin
    @assert ConceptCodes.proc_codes.blood_culture == "LAB10228"
end

@testitem "utils.cd_up_path_by" begin
    # Save the original directory to restore it after tests
    original_dir = pwd()
    
    try
        # Create a temporary directory structure for testing
        temp_dir = mktempdir()
        nested_path = joinpath(temp_dir, "level1", "level2", "level3")
        mkpath(nested_path)
        
        # Change to the deepest directory
        cd(nested_path)
        
        # Test moving up 1 level
        cd_up_path_by(1, "level1/level2"; verbose=false)
        @test basename(pwd()) == "level2"
        
        # Test moving up 2 levels
        cd(nested_path)  # Go back to deepest level
        cd_up_path_by(2, "level1"; verbose=false)
        @test basename(pwd()) == "level1"
        
        # Test error case - invalid path fragment
        cd(nested_path)  # Go back to deepest level
        @test_throws ErrorException cd_up_path_by(1, "invalid/path"; verbose=false)
        
    finally
        # Always return to the original directory
        cd(original_dir)
    end
end