{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.MaterialBase.Drug
  ( Drug(..)
  , drugSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype Drug = Drug Bool
  deriving (Show, Eq)

drugSchema :: FC.Fleece schema => schema Drug
drugSchema =
  FC.coerceSchema FC.boolean