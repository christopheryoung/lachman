{-# LANGUAGE OverloadedStrings, NamedFieldPuns #-}

module Lachmann.Artificial where

import           Lachmann.Core
import qualified Data.Text as T


data MSCopySpec = MSCopySpec {
  ms_identifier :: T.Text
  ,parents :: [Int]
  }

copyTextWithErrors :: [T.Text] -> T.Text
copyTextWithErrors [] = ""
copyTextWithErrors [t] = T.append t " garbage"
copyTextWithErrors (t:ts) = copyTextWithErrors [t]

extendTradition :: Tradition -> MSCopySpec -> Tradition
extendTradition Tradition{edgelist, mss} MSCopySpec{ms_identifier, parents} = trad where
  trad = Tradition (new_edges ++ edgelist) (new_ms:mss) where
  parent_mss = map (mss !!) parents
  texts = map text parent_mss
  t = copyTextWithErrors texts
  new_ms = Manuscript ms_identifier t
  new_edges = map (\x -> (ms_id x, ms_identifier)) parent_mss

makeTradition :: Manuscript -> [MSCopySpec] -> Tradition
makeTradition archetype mss_specs = foldl extendTradition start_trad mss_specs where
  start_trad = Tradition [] [archetype]
