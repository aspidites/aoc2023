module Day2.Part2Spec (spec) where

import Test.Hspec
import AoC.Day2.Part2

game1, game2, game3, game4, game5 :: String
game1 = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
game2 = "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue"
game3 = "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"
game4 = "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red"
game5 = "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"

spec :: Spec
spec = do
  describe "Day2.Part2.power" $ do
    it game1 $ do
      power (parse game1) `shouldBe` 48

    it game2 $ do
      power (parse game2) `shouldBe` 12

    it game3 $ do
      power (parse game3) `shouldBe` 1560

    it game4 $ do
      power (parse game4) `shouldBe` 630

    it game5 $ do
      power (parse game5) `shouldBe` 36

  describe "Day2.Part2.solve" $ do

    it "day2.part1.txt" $ do
      input <- readFile "./inputs/day02.part01.txt"
      solve input `shouldBe` 2286

    it "day02.txt" $ do
      input <- readFile "./inputs/day02.txt"
      solve input `shouldBe` 54699
