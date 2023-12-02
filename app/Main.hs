module Main where

import AoC.Day1.Part2

main :: IO ()
main = print . solve =<< readFile "./inputs/day1.txt"
