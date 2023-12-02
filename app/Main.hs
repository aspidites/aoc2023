module Main where

import AoC.Day1.Part2
import Control.Monad (forM_)

main :: IO ()
main = do
  input <- readFile "./inputs/day1.txt"
  forM_ (lines input) $ \line -> do
    putStrLn line
    putStrLn $ tokenize line
    print $ parse line
    putStrLn "======="
