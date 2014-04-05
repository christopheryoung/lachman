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

copyTextWithErrors :: T.Text -> T.Text
copyTextWithErrors t = T.append t " garbage"

extendTradition :: Tradition -> (UUID.UUID, Int) -> Tradition
extendTradition Tradition{edgelist, mss} (uuid, ind) = Tradition (new_edge:edgelist) (new_ms:mss) where
  ms = mss !! ind
  t = copyTextWithErrors $ text ms
  new_ms = Manuscript uuid t
  new_edge = (ms_id ms, uuid)


data MSCopyConfig = MSCopyConfig {
  uuid :: UUID.UUID
  ,parents :: [Int]
  }

type MSS_Spec = (UUID.UUID, Int)

makeTradition :: Manuscript -> [MSS_Spec] -> Tradition
makeTradition archetype mss_spec_list = foldl extendTradition start_trad mss_spec_list where
  start_trad = Tradition [] [archetype]


--- crud to toy around with this

uuid_ = fromJust . fromString $ "c2cc10e1-57d6-4b6f-9899-38d972112d8c"
l = [(uuid_, 0), (uuid_, 1), (uuid_, 0), (uuid_, 2)] :: [MSS_Spec]
m1 = Manuscript uuid $ "foo" where
  uuid = uuid_

