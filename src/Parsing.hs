module Parsing where

import Text.ParserCombinators.ReadP

import Data.Char (isDigit)


parseMaybe :: ReadP a -> String -> Maybe a
parseMaybe p s = case readP_to_S p s of
  [] -> Nothing
  xs -> Just . fst $ last xs

parseInt :: (Read a, Num a) => ReadP a
parseInt = many1 (satisfy isDigit) >>= pure . read
