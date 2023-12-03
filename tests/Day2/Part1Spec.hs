module Day2.Part1Spec (spec) where

import Test.Hspec
import AoC.Day2.Part1

game1, game2, game3, game4, game5 :: String
game1 = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
game2 = "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue"
game3 = "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"
game4 = "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red"
game5 = "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"

spec :: Spec
spec = do
  describe "Day2.Part1.parse" $ do
    it game1 $ do
      parse game1 `shouldBe` Game 1
        [ Grab [ Cube 3 Blue, Cube 4 Red ]
        , Grab [ Cube 1 Red, Cube 2 Green, Cube 6 Blue ]
        , Grab [ Cube 2 Green ]
        ]
    it game2 $ do
      parse game2 `shouldBe` Game 2
        [ Grab [ Cube 1 Blue, Cube 2 Green ]
        , Grab [ Cube 3 Green, Cube 4 Blue, Cube 1 Red ]
        , Grab [ Cube 1 Green, Cube 1 Blue ]
        ]
    it game3 $ do
      parse game3 `shouldBe` Game 3
        [ Grab [ Cube 8 Green, Cube 6 Blue, Cube 20 Red ]
        , Grab [ Cube 5 Blue, Cube 4 Red, Cube 13 Green ]
        , Grab [ Cube 5 Green, Cube 1 Red ]
        ]
    it game4 $ do
      parse game4 `shouldBe` Game 4
        [ Grab [ Cube 1 Green, Cube 3 Red, Cube 6 Blue ]
        , Grab [ Cube 3 Green, Cube 6 Red ]
        , Grab [ Cube 3 Green, Cube 15 Blue, Cube 14 Red ]
        ]
    it game5 $ do
      parse game5 `shouldBe` Game 5
        [ Grab [ Cube 6 Red, Cube 1 Blue, Cube 3 Green ]
        , Grab [ Cube 2 Blue, Cube 1 Red, Cube 2 Green ]
        ]
  describe "Day2.Part1.solve" $ do
    it "day2.part1.txt" $ do
      input <- readFile "./inputs/day2.part1.txt"
      solve input `shouldBe` 8
