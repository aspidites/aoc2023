# aoc2023
Advent Of Code solutions, mostly in Haskell

## Dependencies

- GHC: 9.4.6
- cabal-install: 3.8.1.0

The recommended way to install these is via [GHCup](https://www.haskell.org/get-started/#ghcup-universal-installer)

# Running
This Repo follows the spec [outlined here](https://github.com/mattcl/aoc-benchmarks/blob/master/SPECIFICATION.md)

Once dependencies are installed, you can run with the following cabal command:

`cabal run aoc2023 -- --help`

For example, to run Day 1 solutions, you can use the following command:
```
cabal run aoc2023 -- --day 1 --input ./inputs/day01.txt --json
```

# Installing
You can install using cabal as well:
```cabal install```

In which case, the executable will live in `$HOME/.cabal/bin`

Alternatively, you can use the CI script to install:
```./ci/scripts/install.sh```

In which case, the bin will be copied locally to `./tmp/aoc2023`
