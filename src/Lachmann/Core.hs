{-# LANGUAGE OverloadedStrings, NamedFieldPuns #-}

module Lachmann.Core where

import Control.Monad.Random
import Data.Text as T
import Data.Graph.Inductive

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


data ToyMS = ToyMS {
  toyms_id :: T.Text
               }

instance Show ToyMS where
  show = T.unpack . toyms_id

type ToyTrad = Gr ToyMS CopyRelation

-- type ToyTrad = ToyTrad {
--   toy_edges :: [CopyRelation]
--   ,toy_mss :: [ToyMS]
--   }

type CopyRelation = (T.Text, T.Text)

data CopySpec = CopySpec {
  copies :: Int
                         }

--instance Graph ToyTrad ToyMS()


-- mkTraditionGraph :: MonadRandom m => ToyMS -> CopySpec -> m ToyTrad
-- mkTraditionGraph archetype spec = do $ mkGraph nodes edges where
--                                     m1 = (1, ToyMS "foo")
--                                     m2 = (2, ToyMS "bar")



-- mkTraditionGraph :: Tradition -> Gr Manuscript Int
-- mkTraditionGraph trad = Data.Graph.Inductive.mkGraph (mss trad) (edgelist trad)

g :: Gr String Int
g = ([],1,"a",[]) & Data.Graph.Inductive.empty

