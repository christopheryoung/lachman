module Main where

import Test.Tasty (defaultMain,testGroup,TestTree)

import Lachmann.Artificial.Test
import Lachmann.Core.Test

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "All Tests"
            [ artificialSuite
            , coreSuite
            ]
