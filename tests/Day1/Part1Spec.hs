module Day1.Part1Spec (spec) where

import Test.Hspec
import AoC.Day1.Part1

spec :: Spec
spec = do
  describe "Day1.Part1.parse" $ do
    it "1abc2" $ do
      parse "1abc2" `shouldBe` 12

    it "pqr3stu8vwx" $ do
      parse "pqr3stu8vwx" `shouldBe` 38

    it "a1b2c3d4e5f" $ do
      parse "a1b2c3d4e5f" `shouldBe` 15

    it "treb7uchet" $ do
      parse "treb7uchet" `shouldBe` 77

  describe "Day1.Part1.solve" $ do
    it "day1.part1.txt" $ do
      input <- readFile "./inputs/day1.part1.txt"
      solve input `shouldBe` 142
