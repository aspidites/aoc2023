{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Applicative
import AoC.Day1 qualified as Day1
import AoC.Day2 qualified as Day2

import Data.ByteString.Lazy.Char8 qualified as BS
import Cli
import Options.Generic
import System.Environment
import Data.Aeson

solutions :: [(Int, (String -> Int, String -> Int))]
solutions = 
  [ (1, ( Day1.part1, Day1.part2 ) )
  , (2, ( Day2.part1, Day2.part2 ) )
  ]

run :: Maybe Int -> Maybe String -> Maybe Bool -> IO ()
run Nothing _ _ = putStrLn "Please specify which day's solutions you want to run as an integer"
run _ Nothing _ = putStrLn "Please specify an input file to run solutions against"
run (Just d) (Just i) json = do
  input <- readFile i

  case lookup d solutions of
    Nothing -> putStrLn "not implemented"
    Just (part1, part2) -> do
      let partOne = part1 input
          partTwo = part2 input
      
      case json of
        Just True -> do
          BS.putStrLn $ encode $ object 
            [ "part_one" .= partOne
            , "part_two" .= partTwo
            ]
        _ -> do
          print partOne
          print partTwo

main :: IO ()
main = do
  -- parse commandline options
  options <- unwrapRecord "Advent of Code 2023"

  -- parse environment variables
  d :: Maybe Int <- fmap read <$> lookupEnv "AOC_DAY"
  i <- lookupEnv "AOC_INPUT"
  j :: Maybe Bool <- fmap read <$> lookupEnv "AOC_JSON"

  -- prefer commandline options over env variables
  run (day options <|> d) (input options <|> i) (Just (json options) <|> j)
