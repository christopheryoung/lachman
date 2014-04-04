{-# LANGUAGE FlexibleInstances, MultiParamTypeClasses #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Lachmann.Artificial.Test
    (artificialSuite)
where

import Test.Tasty (testGroup, TestTree)
import Test.Tasty.HUnit
import Test.Tasty.SmallCheck as SC

import Lachmann.Artificial
import Test.SmallCheck.Series

artificialSuite = undefined
