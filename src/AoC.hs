module AoC (solutions) where

import AoC.Day1 qualified as Day1
import AoC.Day2 qualified as Day2


solutions :: [(Int, (String -> Int, String -> Int))]
solutions = 
  [ (1, ( Day1.part1, Day1.part2 ) )
  , (2, ( Day2.part1, Day2.part2 ) )
  ]

