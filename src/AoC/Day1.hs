module AoC.Day1 (parse, solve) where

import Data.Char (isDigit)

parse :: String -> Int
parse input = case filter isDigit input of
  [] -> 0
  [x] -> read [x, x]
  (x:xs) -> read $ [x, last xs]



solve :: String -> Int
solve = sum . map parse . lines
