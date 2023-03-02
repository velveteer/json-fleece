{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.StaffBase.Linguist
  ( Linguist(..)
  , linguistSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype Linguist = Linguist Bool
  deriving (Show, Eq)

linguistSchema :: FC.Fleece schema => schema Linguist
linguistSchema =
  FC.coerceSchema FC.boolean