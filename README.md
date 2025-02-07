# Probabilistic Prescribing Tools

A mixture of tools for working on probabilstic programming tasks at UCLH.

Write your code under `src/`
Decide what you want to export at module level 
Write tests under `tests/runtests.jl`

Check the tests pass from the REPL

```julia
using Pkg
Pkg.test()
```

Experiment and play under `scratch/` (not under version control), or under `dev/` (under version control)
Preface any scratch of dev scripts with 

```julia
using pptools
```

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://docsteveharris.github.io/pptools.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://docsteveharris.github.io/pptools.jl/dev/)
[![Build Status](https://github.com/docsteveharris/pptools.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/docsteveharris/pptools.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/docsteveharris/pptools.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/docsteveharris/pptools.jl)
