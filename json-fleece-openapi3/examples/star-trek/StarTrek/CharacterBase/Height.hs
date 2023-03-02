{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.CharacterBase.Height
  ( Height(..)
  , heightSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Eq, Integer, Show)

newtype Height = Height Integer
  deriving (Show, Eq)

heightSchema :: FC.Fleece schema => schema Height
heightSchema =
  FC.coerceSchema FC.integer