module utils

using Formatting

export foobar
export hello
export number_to_text

"""
Convert a number to text
Useful when working with Julia DataFrames that often express numbers in scientific notation
This is a problem when the number is a key and you're tracking it
"""
function number_to_text(x::Number)
    format(x, commas=false)
end

"""
Foobar function
Returns foo by default unless argument is false
"""
function foobar(;foo=true)
    return foo ? "foo" : "bar"
end

"""
Returns a greeting
"""
function hello(x::String; verbose=true)
    s = "Hello, $(x)!"
    verbose && println(s)
    return s
end

end # end module