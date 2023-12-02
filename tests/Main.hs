module Main (main) where

import Test.Hspec
import AoC.Day1
import Data.Text.IO qualified as T

main :: IO ()
main = hspec $ do
  describe "Day1.parse" $ do
    it "returns 12" $ do
      parse "1abc2" `shouldBe` 12

    it "returns 38" $ do
      parse "pqr3stu8vwx" `shouldBe` 38

    it "returns 15" $ do
      parse "a1b2c3d4e5f" `shouldBe` 15

    it "returns 77" $ do
      parse "treb7uchet" `shouldBe` 77
  describe "Day1.solve" $ do
    it "returns 142" $ do
      input <- T.readFile "inputs/day1.txt"
      solve input `shouldBe` 142
