module Day1.Part2Spec (spec) where

import Test.Hspec
import AoC.Day1.Part2

spec :: Spec
spec = do
  describe "Day1.Part2.parse" $ do
    it "two1nine" $ do
      parse "two1nine" `shouldBe` 29

    it "eightwothree" $ do
      parse "eightwothree" `shouldBe` 83

    it "abcone2threexyz" $ do
      parse "abcone2threexyz" `shouldBe` 13

    it "xtwone3four" $ do
      parse "xtwone3four" `shouldBe` 24

    it "4nineeightseven2" $ do
      parse "4nineeightseven2" `shouldBe` 42

    it "zoneight234" $ do
      parse "zoneight234" `shouldBe` 14

    it "7pqrstsixteen" $ do 
      parse "7pqrstsixteen" `shouldBe` 76

    it "eighthree" $ do
      parse "eighthree" `shouldBe` 83

  describe "Day1.Part2.solve" $ do
    it "day01.part02.txt" $ do
      input <- readFile "./inputs/day01.part02.txt"
      solve input `shouldBe` 281

    it "day01.txt" $ do
      input <- readFile "./inputs/day01.txt"
      solve input `shouldBe` 55358
