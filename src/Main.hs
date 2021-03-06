{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Monad (replicateM, liftM)
import           Data.Text as T
import           Data.UUID as UUID (toString)
import           Data.UUID.V4 (nextRandom)
import           Lachmann.Artificial (makeTradition, MSCopySpec(MSCopySpec))
import           Lachmann.Core (Manuscript(Manuscript))

main :: IO ()
main = do
  uuids <- replicateM 10 $ (liftM (T.pack . toString)) $ nextRandom

  let mytrad = makeTradition m1 l where
      s1 = MSCopySpec (uuids !! 0) [0]
      s2 = MSCopySpec (uuids !! 1) [1]
      s3 = MSCopySpec (uuids !! 2) [1]
      s4 = MSCopySpec (uuids !! 3) [2]
      s5 = MSCopySpec (uuids !! 4) [1, 2]
      l = [s1, s2, s3, s4, s5]
      m1 = Manuscript (uuids !! 5) $ "foo"
  print mytrad

