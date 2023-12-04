{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Applicative ((<|>))
import Control.Monad (when)

import Cli
import Options.Generic
import System.Environment
import System.Exit
import Paths_aoc2023 qualified as Paths
import Data.Version (showVersion)

main :: IO ()
main = do
  -- parse commandline options
  options <- unwrapRecord "Advent of Code 2023"
  when (version options) $ do
    putStrLn (showVersion Paths.version) 
    exitSuccess

  -- parse environment variables
  d :: Maybe Int <- fmap read <$> lookupEnv "AOC_DAY"
  i <- lookupEnv "AOC_INPUT"

  -- prefer commandline options over env variables
  run (day options <|> d) (input options <|> i)
