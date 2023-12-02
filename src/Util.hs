module Util where

import Text.ParserCombinators.ReadP


parseMaybe :: ReadP a -> String -> Maybe a
parseMaybe p s = case readP_to_S p s of
  [] -> Nothing
  xs -> Just . fst $ last xs
