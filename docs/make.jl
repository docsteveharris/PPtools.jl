using pptools
using Documenter

DocMeta.setdocmeta!(pptools, :DocTestSetup, :(using pptools); recursive=true)

makedocs(;
    modules=[pptools],
    authors="Steve Harris <git@steveharris.me> and contributors",
    sitename="pptools.jl",
    format=Documenter.HTML(;
        canonical="https://docsteveharris.github.io/pptools.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/docsteveharris/pptools.jl",
    devbranch="main",
)
