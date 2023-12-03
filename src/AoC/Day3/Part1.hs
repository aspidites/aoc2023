module AoC.Day3.Part1 
  -- (parse, solve)
  where

import Util
import Control.Monad (join)
import Data.Char
import Data.Maybe

type Schematic = [String]
type Coord = (Int, Int)

symbols :: [Char]
symbols = "!@#$%^&*"


coords :: Schematic -> [(Int, Int)]
coords schema = [(x, x) | x <- [0..length schema - 1]]

getNeighbors :: Schematic -> [((Int, Int), Char, [Char])]
getNeighbors schema = [((x, y), schema !! x !! y, neighbors coord schema) | coord@(x, y) <- coords schema, isDigit (schema !! x !! y)]

parse :: String -> Schematic
parse = lines

{- 
 - nw n ne    (-1, -1) (-1, 0) (-1, +1)
 - w  x e  == (-1,  0) ( x, y) (+1,  0)
 - sw s se    (-1, +1) (0, +1) (+1+1)
-}
neighbors :: Coord -> Schematic -> [Char]
neighbors (x, y) schema =  filter (`elem` symbols) $ catMaybes [ nw, n, ne, w, e, sw, s, se]
  where
    above = schema !? (x - 1)
    row = schema !? x
    below = schema !? (x + 1)

    nw = (!? (y - 1)) =<< above
    n = (!? y) =<< above
    ne = (!? (y + 1)) =<< above

    w = (!? (y - 1)) =<< row
    -- cell = (!? y) =<< row
    e = (!? (y + 1)) =<< row

    sw = (!? (y - 1)) =<< below
    s = (!? y) =<< below
    se = (!? (y + 1)) =<< below

  

solve :: String -> Int
solve = error "not implemented"
