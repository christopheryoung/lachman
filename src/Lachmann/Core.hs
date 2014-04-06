module Lachmann.Core where

import Data.Text as T


type MSEdge = (T.Text, T.Text)


data Tradition = Tradition {
  -- ,_trad_name :: T.Text
  edgelist :: [MSEdge]
  ,mss :: [Manuscript]
  } deriving (Show)


data Manuscript = Manuscript {
  ms_id :: T.Text
  -- ,_name :: T.Text
  -- ,_description :: T.Text
  ,text :: T.Text
  } deriving (Show, Eq, Ord)
