module AoC.Day2.Part2 (parse, power, solve) where

import AoC.Day2.Part1 (Cube(..), Color(..), Game(..), Grab(..), parse)

power :: Game -> Int
power game = minRed * minGreen * minBlue
  where
    cs = concatMap cubes $ grabs game
    minRed = qty . maximum $ filter (\c -> color c == Red) cs
    minGreen = qty . maximum $ filter (\c -> color c == Green) cs
    minBlue = qty . maximum $ filter (\c -> color c == Blue) cs

solve :: String -> Int
solve = sum . map (power . parse) . lines
