module AoC.Day1.Part2 (parse, solve) where

tokenize :: String -> [Char]
tokenize = \case
    "" -> []
    '1' : rest -> '1' : tokenize rest
    '2' : rest -> '2' : tokenize rest
    '3' : rest -> '3' : tokenize rest
    '4' : rest -> '4' : tokenize rest
    '5' : rest -> '5' : tokenize rest
    '6' : rest -> '6' : tokenize rest
    '7' : rest -> '7' : tokenize rest
    '8' : rest -> '8' : tokenize rest
    '9' : rest -> '9' : tokenize rest
    'o' : 'n' : 'e' : rest -> '1' : tokenize ("ne" <> rest)
    't' : 'w' : 'o' : rest -> '2' : tokenize ("wo" <> rest)
    't' : 'h' : 'r' : 'e' : 'e' : rest -> '3' : tokenize ("hree" <> rest)
    'f' : 'o' : 'u' : 'r' : rest -> '4' : tokenize ("our" <> rest)
    'f' : 'i' : 'v' : 'e' : rest -> '5' : tokenize ("ive" <> rest)
    's' : 'i' : 'x' : rest -> '6' : tokenize ("ix" <> rest)
    's' : 'e' : 'v' : 'e' : 'n' : rest -> '7' : tokenize ("even" <> rest)
    'e' : 'i' : 'g' : 'h' : 't' : rest -> '8' : tokenize ("ight" <> rest)
    'n' : 'i' : 'n' : 'e' : rest -> '9' : tokenize ("ine" <> rest)
    (_:xs) -> tokenize xs

parse :: String -> Int
parse input = case tokenize input of
  [] -> 0
  [x] -> read [x, x]
  (x:xs) -> read [x, last xs]


solve :: String -> Int
solve = sum . map parse . lines
