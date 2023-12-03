{-# LANGUAGE DataKinds #-}
module Cli ( Config(..), run ) where

import AoC.Day1 qualified as Day1
import AoC.Day2 qualified as Day2
import Data.Aeson
import Data.ByteString.Lazy.Char8 qualified as BS
import Options.Generic


solutions :: [(Int, (String -> Int, String -> Int))]
solutions = 
  [ (1, ( Day1.part1, Day1.part2 ) )
  , (2, ( Day2.part1, Day2.part2 ) )
  ]

data Config w = Config
  { day :: w ::: Maybe Int <?> "Which day to run solutions for"
  , input :: w ::: Maybe String <?> "Input file to run solution against"
  , json :: w ::: Bool <?> "Whether or not to show results as JSON"
  } deriving (Generic)

instance ParseRecord (Config Wrapped)
deriving instance Show (Config Unwrapped)

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

