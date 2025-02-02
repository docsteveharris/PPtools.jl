module utils

using Formatting

export foobar
export hello
export number_to_text
export read_sql_script

"""
Read and clean a SQL script file
"""
function read_sql_script(filepath::String;
    remove_comments::Bool=false,
    split_statements::Bool=false)
    if !isfile(filepath)
        throw(ArgumentError("File not found: $filepath"))
    end

    try
        content = read(filepath, String)

        if remove_comments
            # Remove inline comments
            content = replace(content, r"--.*$"m => "")
            # Remove block comments
            content = replace(content, r"/\*[\s\S]*?\*/" => "")
        end

        # Beware this returns an array not a string
        if split_statements
            # Split on semicolons (basic approach)
            statements = split(content, ";")
            # Remove empty statements and trim whitespace
            return filter(!isempty, strip.(statements))
        end

        # Remove blank lines
        # note the use of  ⁠∘ (typed as \circ<tab>) which is simply function composition
        # Basic function composition
        # (f ∘ g)(x) = f(g(x))
        # These are equivalent:
        # filter(!isempty ∘ strip, lines)
        # filter(x -> !isempty(strip(x)), lines)
        content = join(filter(!isempty ∘ strip, split(content, '\n')), '\n')
        return content
    catch e
        throw(ErrorException("Error processing SQL file: $(e.msg)"))
    end
end


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
function foobar(; foo=true)
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