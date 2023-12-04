#!/bin/sh
set -e

# install dependencies
cabal build

# run tests
cabal test

# install executable
mkdir -p tmp
cp -L $(cabal list-bin aoc2023) tmp
