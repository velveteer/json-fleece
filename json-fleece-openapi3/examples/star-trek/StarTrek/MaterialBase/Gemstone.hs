{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.MaterialBase.Gemstone
  ( Gemstone(..)
  , gemstoneSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype Gemstone = Gemstone Bool
  deriving (Show, Eq)

gemstoneSchema :: FC.Fleece schema => schema Gemstone
gemstoneSchema =
  FC.coerceSchema FC.boolean