{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
module Cli ( Config(..), opts, run ) where

import Paths_aoc2023 qualified as Paths
import AoC (solutions)
import Data.Aeson
import Data.ByteString.Lazy.Char8 qualified as BS
import Options.Applicative
import Data.Version (showVersion)

data Config = Config
  { day :: Maybe Int
  , input :: Maybe String
  , json :: Bool
  } deriving (Show) 

options :: Parser Config
options = Config
      <$> optional (option auto
        ( long "day"
       <> metavar "DAY" 
       <> help "Which day to run solutions for"
        ))
      <*> optional (strOption
        ( long "input"
       <> metavar "FILEPATH"
       <> help "Input file to run solution against"
        ))
      <*> switch
        ( long "json"
       <> help "Deprecated: This flag used to turn on/off json output"
        )

opts :: ParserInfo Config
opts = 
  info 
    (options <**> helper <**> simpleVersioner (showVersion Paths.version))
    ( fullDesc
    <> progDesc "Run Advent of Code 2023 solutions"
    <> header "aoc2023 - solutions for AoC 2023 in Haskell"
    )

run :: Config -> IO ()
run (Config Nothing _ _) = putStrLn "Please specify which day's solutions you want to run as an integer"
run (Config _ Nothing _) = putStrLn "Please specify an input file to run solutions against"
run (Config (Just d) (Just i) _) = do


  input <- readFile $ i

  case lookup d solutions of
    Nothing -> putStrLn "not implemented"
    Just (part1, part2) -> do
      let partOne = part1 input
          partTwo = part2 input
      
      BS.putStrLn $ encode $ object 
        [ "part_one" .= partOne
        , "part_two" .= partTwo
        ]
