module Main where

import Criterion.Main
import AoC.Day1 qualified as Day1
import AoC.Day2 qualified as Day2

main :: IO ()
main = do 
  day1 <- readFile "./inputs/day01.txt"
  day2 <- readFile "./inputs/day02.txt"

  defaultMain
    [ bgroup "Day1"
      [ bench "Part1" $ whnf Day1.part1 day1
      , bench "Part2" $ whnf Day1.part2 day1
      ]
    , bgroup "Day2"
      [ bench "Part1" $ whnf Day2.part1 day2
      , bench "Part2" $ whnf Day2.part2 day2
      ]
    ]
