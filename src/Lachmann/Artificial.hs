{-# LANGUAGE TemplateHaskell, OverloadedStrings, NamedFieldPuns #-}

module Lachmann.Artificial where

import           Data.Maybe (fromJust)
import           Data.Graph
import qualified Data.Text as T
import           Data.Map (Map)
import           Data.UUID as UUID


data Manuscript = Manuscript {
  ms_id :: UUID.UUID
  -- ,_name :: T.Text
  -- ,_description :: T.Text
  ,text :: T.Text
  } deriving (Show, Eq, Ord)

type MSEdge = (UUID.UUID, UUID.UUID)

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
extendTradition Tradition{edgelist, mss} MSCopySpec{uuid, parents} = Tradition (new_edges ++ edgelist) (new_ms:mss) where
  parent_mss = map (mss !!) parents
  text_list = map text parent_mss
  parent_uuids = map ms_id parent_mss
  t = copyTextWithErrors text_list
  new_ms = Manuscript uuid t
  new_edges = map (\x -> (x, uuid)) parent_uuids

data MSCopySpec = MSCopySpec {
  uuid :: UUID.UUID
  ,parents :: [Int]
  }

makeTradition :: Manuscript -> [MSCopySpec] -> Tradition
makeTradition archetype mss_spec_list = foldl extendTradition start_trad mss_spec_list where
  start_trad = Tradition [] [archetype]

--- crud to toy around with this

uuid_ = fromJust . fromString $ "c2cc10e1-57d6-4b6f-9899-38d972112d8c"

s1 = MSCopySpec uuid_ [0]
s2 = MSCopySpec uuid_ [1]
s3 = MSCopySpec uuid_ [1]
s4 = MSCopySpec uuid_ [2]
s5 = MSCopySpec uuid_ [1, 2]
l = [s1, s2, s3, s4, s5]
m1 = Manuscript uuid_ $ "foo"
