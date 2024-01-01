module Main (main) where

import Test.Tasty (defaultMain, testGroup)
import Test.Tasty.Hspec (testSpecs)

main :: IO ()
main = do
  specs <-
    concat
      <$> mapM
        testSpecs
        []
  goldens <- sequence []
  defaultMain $
    testGroup
      "recollect-library"
      [ testGroup "Specs" specs,
        testGroup "Golden" goldens
      ]
