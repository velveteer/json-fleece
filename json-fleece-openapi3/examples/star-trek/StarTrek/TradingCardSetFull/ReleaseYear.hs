{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.TradingCardSetFull.ReleaseYear
  ( ReleaseYear(..)
  , releaseYearSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Eq, Integer, Show)

newtype ReleaseYear = ReleaseYear Integer
  deriving (Show, Eq)

releaseYearSchema :: FC.Fleece schema => schema ReleaseYear
releaseYearSchema =
  FC.coerceSchema FC.integer