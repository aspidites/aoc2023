{-# LANGUAGE OverloadedStrings #-}
module Main where

import Options.Applicative
import System.Environment

import Cli

main :: IO ()
main = do
  Config configDay configInput _ <- execParser opts

  -- parse environment variables
  envDay :: Maybe Int <- fmap read <$> lookupEnv "AOC_DAY"
  envInput <- lookupEnv "AOC_INPUT"

  run (Config (envDay <|> configDay) (envInput <|> configInput) True)
