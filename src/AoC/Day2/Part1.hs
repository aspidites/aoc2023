module AoC.Day2.Part1 
  ( Cube(..)
  , Color(..)
  , Grab(..)
  , Game(..) 
  , Bag(..)
  , emptyBag
  , parse
  , solve
  ) where

import Control.Applicative ((<|>))
import Control.Monad (void)
import Data.Maybe
import Parsing
import Text.ParserCombinators.ReadP hiding (get)

data Color = Red | Green | Blue deriving (Eq, Show, Ord)

data Cube = Cube 
  { qty :: Int 
  , color :: Color 
  } deriving (Eq, Show, Ord)

data Grab = Grab 
  { cubes :: [Cube] 
  } deriving (Eq, Show, Ord)

data Game = Game 
  { gameId :: Int 
  , grabs :: [Grab] 
  } deriving (Eq, Show, Ord)

data Bag = Bag
  { reds :: Cube 
  , greens :: Cube 
  , blues :: Cube 
  } deriving (Eq, Show)
  
emptyBag :: Bag
emptyBag = Bag
  { reds = Cube 0 Red
  , greens = Cube 0 Green 
  , blues = Cube 0 Blue 
  }

grabCubes :: [Cube] -> Bag -> Maybe Bag
grabCubes [] bag = Just bag
grabCubes (cube:cs) bag = go
  where
    go = case cube of
      Cube c Red | qty (reds bag) - c < 0 -> Nothing
                 | otherwise -> grabCubes cs bag { reds = Cube (qty (reds bag) - c) Red }

      Cube c Green | qty (greens bag) - c < 0 -> Nothing
                   | otherwise -> grabCubes cs bag { greens = Cube (qty (reds bag) - c) Green }

      Cube c Blue | qty (blues bag) - c < 0 -> Nothing
                  | otherwise -> grabCubes cs bag { blues = Cube (qty (reds bag) - c) Blue }

parseCube :: ReadP Cube
parseCube = do
  qty <- parseInt
  skipSpaces
  color <- string "red" *> pure Red 
       <|> string "green" *> pure Green
       <|> string "blue" *> pure Blue
  pure $ Cube qty color

parseGrab :: ReadP Grab
parseGrab = Grab <$> parseCube `sepBy1` (char ',' <* skipSpaces)

parseGame :: ReadP Game
parseGame = do
  void $ string "Game"
  skipSpaces
  i <- parseInt  
  void $ char ':'
  skipSpaces
  allGrabs <- parseGrab `sepBy` (char ';' <* skipSpaces)
  pure $ Game i allGrabs

parse :: String -> Game
parse = fromMaybe (error "Could not parse game") 
      . parseMaybe parseGame

getIds :: [Game] -> Int
getIds = foldr step 0
  where
    step (Game i _) total = i + total

runGame :: Bag -> Game -> Maybe Int
runGame bag (Game i allGrabs) = foldr step (Just i) allGrabs
  where
    step :: Grab -> Maybe Int -> Maybe Int
    step (Grab allCubes) pass = case grabCubes allCubes bag of
      Nothing -> Nothing
      Just _ -> pass

testBag :: Bag
testBag = Bag 
  { reds = Cube 12 Red 
  , greens = Cube 13 Green
  , blues = Cube 14 Blue
  }

solve :: String -> Int
solve = sum . catMaybes . map (runGame testBag . parse) . lines
