{-# LANGUAGE OverloadedStrings #-}
module Main where

import Control.Applicative

import Cli
import Options.Generic
import System.Environment

main :: IO ()
main = do
  -- parse commandline options
  options <- unwrapRecord "Advent of Code 2023"

  -- parse environment variables
  d :: Maybe Int <- fmap read <$> lookupEnv "AOC_DAY"
  i <- lookupEnv "AOC_INPUT"

  -- prefer commandline options over env variables
  run (day options <|> d) (input options <|> i)
