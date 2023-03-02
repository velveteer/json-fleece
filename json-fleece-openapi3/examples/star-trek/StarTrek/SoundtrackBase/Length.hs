{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.SoundtrackBase.Length
  ( Length(..)
  , lengthSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Eq, Integer, Show)

newtype Length = Length Integer
  deriving (Show, Eq)

lengthSchema :: FC.Fleece schema => schema Length
lengthSchema =
  FC.coerceSchema FC.integer