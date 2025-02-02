module wrangle

using Dates

export sqlite_datetime_to_date

"""
Convert a SQLite datetime string to a Julia DateTime object
NB: Basic ⁠DateTime is timezone-naive. If you need timezone awareness, you should use the ⁠TimeZones.jl package
"""
function sqlite_datetime_to_date(x::String)
    return Dates.DateTime(x, "yyyy-mm-dd HH:MM:SS")
end

end