{-# LANGUAGE OverloadedStrings, NamedFieldPuns #-}

module Lachmann.Artificial where

import qualified Data.Text as T


data Manuscript = Manuscript {
  ms_id :: T.Text
  -- ,_name :: T.Text
  -- ,_description :: T.Text
  ,text :: T.Text
  } deriving (Show, Eq, Ord)

type MSEdge = (T.Text, T.Text)

data Tradition = Tradition {
  -- ,_trad_name :: T.Text
  edgelist :: [MSEdge]
  ,mss :: [Manuscript]
  } deriving (Show)

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

data MSCopySpec = MSCopySpec {
  ms_identifier :: T.Text
  ,parents :: [Int]
  }

makeTradition :: Manuscript -> [MSCopySpec] -> Tradition
makeTradition archetype mss_spec_list = foldl extendTradition start_trad mss_spec_list where
  start_trad = Tradition [] [archetype]

--- crud to toy around with this

