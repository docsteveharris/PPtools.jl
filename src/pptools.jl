module PPtools # Define the module

# Define versions and dependencies
# e.g. 
# using DataFrames

# Import local scripts
include("utils/utils.jl")

# Re-export specific functions so they can be accessed via eda.<function>
using .utils

# Export specific functions so they can be accessed directly
# e.g.
# export foobar
export number_to_text
export read_sql_script

# Top level defined functions
hi() = "Hello World!"
bye() = "Bye for now"


end # end module
