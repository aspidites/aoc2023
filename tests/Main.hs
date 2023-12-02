module Main (main) where

import Test.Hspec
import AoC.Day1.Part1 qualified as P1
import AoC.Day1.Part2 qualified as P2

main :: IO ()
main = hspec $ do
  describe "Day1.Part1.parse" $ do
    it "1abc2 returns 12" $ do
      P1.parse "1abc2" `shouldBe` 12

    it "pqr3stu8vwx returns 38" $ do
      P1.parse "pqr3stu8vwx" `shouldBe` 38

    it "a1b2c3d4e5f returns 15" $ do
      P1.parse "a1b2c3d4e5f" `shouldBe` 15

    it "treb7uchet returns 77" $ do
      P1.parse "treb7uchet" `shouldBe` 77
  describe "Day1.Part1.solve" $ do
    it "returns 142" $ do
      input <- readFile "./tests/day1/part1.txt"
      P1.solve input `shouldBe` 142

  describe "Day1.Part2.parse" $ do
    it "two1nine returns 29" $ do
      P2.parse "two1nine" `shouldBe` 29

    it "eightwothree returns 83" $ do
      P2.parse "eightwothree" `shouldBe` 83

    it "abcone2threexyz returns 13" $ do
      P2.parse "abcone2threexyz" `shouldBe` 13

    it "xtwone3four returns 24" $ do
      P2.parse "xtwone3four" `shouldBe` 24

    it "4nineeightseven2 returns 42" $ do
      P2.parse "4nineeightseven2" `shouldBe` 42

    it "zoneight234 returns 14" $ do
      P2.parse "zoneight234" `shouldBe` 14

    it "7pqrstsixteen returns 76" $ do 
      P2.parse "7pqrstsixteen" `shouldBe` 76

  describe "Day1.Part2.solve" $ do
    it "returns 281" $ do
      input <- readFile "./tests/day1/part2.txt"
      P2.solve input `shouldBe` 281
