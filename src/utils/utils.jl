module utils

using Printf

export foo, hello

"""
Foobar function
"""
function foo()
    return "bar"
end

function hello(x::String; verbose=true)
    s = "Hello, $(x)!"
    verbose && println(s)
    return s
end

end # end module