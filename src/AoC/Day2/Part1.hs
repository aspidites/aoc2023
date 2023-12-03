module AoC.Day2.Part1 
  ( Cube(..)
  , Color(..)
  , Grab(..)
  , Game(..) 
  , parse
  , solve
  ) where

import Control.Applicative ((<|>))
import Control.Monad (void)
import Control.Monad.Reader
import Data.IORef
import Data.Maybe
import Parsing
import Text.ParserCombinators.ReadP hiding (get)

data Cube = Cube 
  { qty :: Int 
  , color :: Color 
  } deriving (Eq, Show)

data Color = Red | Green | Blue deriving (Eq, Show)

data Grab = Grab [Cube] deriving (Eq, Show)

data Game = Game Int [Grab] deriving (Eq, Show)

data Bag = Bag
  { reds :: Cube 
  , greens :: Cube 
  , blues :: Cube 
  } deriving (Eq, Show)

-- StateT over IO is considered bad, so using ReaderT (IORef a) instead
type GameM a = ReaderT (IORef Bag) IO a

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

simulate :: Game -> GameM (Maybe Int)
simulate = \case
  Game _ [] -> pure Nothing
  Game i grabs -> do
    ref <-  ask
    bag <- liftIO $ readIORef ref
    case go bag grabs of
      Nothing -> pure Nothing
      Just _ -> pure $ Just i
  where
    go :: Bag -> [Grab] -> Maybe Bag
    go b [] = Just b
    go b (Grab cs:gs) = case grabCubes cs b of
      Nothing -> Nothing
      Just b' -> go b' gs

runGame :: Game -> IORef Bag -> IO (Maybe Int)
runGame game = runReaderT (simulate game)

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
  grabs <- parseGrab `sepBy` (char ';' <* skipSpaces)
  pure $ Game i grabs

parse :: String -> Game
parse = fromMaybe (error "Could not parse game") 
      . parseMaybe parseGame

solve :: String -> IO Int
solve input = do
  ref <- newIORef Bag { reds = Cube 12 Red, greens = Cube 13 Green, blues = Cube 14 Blue }
  let games = map parse $ lines input
  ids <- catMaybes <$> mapM (\game -> runGame game ref) games
  pure $ sum ids
