module Main where

import AoC.Day2.Part1

main :: IO ()
main = do
  input <- readFile "./inputs/day2.part1.txt"
  result <- solve input
  print result
