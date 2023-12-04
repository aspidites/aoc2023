{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
module Cli ( Config(..), run ) where

import AoC (solutions)
import Data.Aeson
import Data.ByteString.Lazy.Char8 qualified as BS
import Options.Generic

data Config w = Config
  { day :: w ::: Maybe Int <?> "Which day to run solutions for"
  , input :: w ::: Maybe String <?> "Input file to run solution against"
  , json :: w ::: Bool <?> "Deprecated: This flag used to turn on/off json output"
  , version :: w ::: Bool <?> "Display the current version"
  } deriving (Generic)

instance ParseRecord (Config Wrapped)
deriving instance Show (Config Unwrapped)

run :: Maybe Int -> Maybe String -> IO ()
run Nothing _ = putStrLn "Please specify which day's solutions you want to run as an integer"
run _ Nothing = putStrLn "Please specify an input file to run solutions against"
run (Just d) (Just i) = do
  input <- readFile i

  case lookup d solutions of
    Nothing -> putStrLn "not implemented"
    Just (part1, part2) -> do
      let partOne = part1 input
          partTwo = part2 input
      
      BS.putStrLn $ encode $ object 
        [ "part_one" .= partOne
        , "part_two" .= partTwo
        ]
