#!/bin/sh
set -e

# install dependencies
cabal build

# run tests
cabal test

# run benchmarks
cabal bench
