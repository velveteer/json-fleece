{-# LANGUAGE NoImplicitPrelude #-}

module Uber.Activities.Limit
  ( Limit(..)
  , limitSchema
  ) where

import Data.Int (Int32)
import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Eq, Show)

newtype Limit = Limit Int32
  deriving (Show, Eq)

limitSchema :: FC.Fleece schema => schema Limit
limitSchema =
  FC.coerceSchema FC.int32