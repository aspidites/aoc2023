module Main where

import AoC.Day2.Part2

main :: IO ()
main = print . solve =<< readFile "./inputs/day2.txt"
