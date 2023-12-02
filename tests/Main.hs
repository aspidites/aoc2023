module Main (main) where

import Test.Hspec
import AoC.Day1

main :: IO ()
main = hspec $ do
  describe "Day1.parse" $ do
    it "1abc2 returns 12" $ do
      parse "1abc2" `shouldBe` 12

    it "pqr3stu8vwx returns 38" $ do
      parse "pqr3stu8vwx" `shouldBe` 38

    it "a1b2c3d4e5f returns 15" $ do
      parse "a1b2c3d4e5f" `shouldBe` 15

    it "treb7uchet returns 77" $ do
      parse "treb7uchet" `shouldBe` 77
  describe "Day1.solve" $ do
    it "returns 142" $ do
      input <- readFile "./tests/day1.txt"
      solve input `shouldBe` 142
