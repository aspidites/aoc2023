module Day1.Part2Spec (spec) where

import Test.Hspec
import AoC.Day1.Part2

spec :: Spec
spec = do
  describe "Day1.Part2.parse" $ do
    it "two1nine returns 29" $ do
      parse "two1nine" `shouldBe` 29

    it "eightwothree returns 83" $ do
      parse "eightwothree" `shouldBe` 83

    it "abcone2threexyz returns 13" $ do
      parse "abcone2threexyz" `shouldBe` 13

    it "xtwone3four returns 24" $ do
      parse "xtwone3four" `shouldBe` 24

    it "4nineeightseven2 returns 42" $ do
      parse "4nineeightseven2" `shouldBe` 42

    it "zoneight234 returns 14" $ do
      parse "zoneight234" `shouldBe` 14

    it "7pqrstsixteen returns 76" $ do 
      parse "7pqrstsixteen" `shouldBe` 76

    it "eighthree returns 83" $ do
      parse "eighthree" `shouldBe` 83

  describe "Day1.Part2.solve" $ do
    it "returns 281" $ do
      input <- readFile "./inputs/day1.part2.txt"
      solve input `shouldBe` 281

