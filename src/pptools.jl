module pptools # Define the module

# Define versions and dependencies
# e.g. 
# using DataFrames

# Import local scripts
include("utils/utils.jl")

# Re-export specific functions so they can be accessed via eda.<function>
using .utils

# Export specific functions so they can be accessed directly
export foo

# Top level defined functions
hi() = "Hello World!"
bye() = "Bye for now"


end # end module
