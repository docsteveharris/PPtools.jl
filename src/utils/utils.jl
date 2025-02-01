module utils

using Printf

export foobar, hello

"""
Foobar function
Returns foo by default unless argument is false
"""
function foobar(;foo=true)
    return foo ? "foo" : "bar"
end

function hello(x::String; verbose=true)
    s = "Hello, $(x)!"
    verbose && println(s)
    return s
end

end # end module