{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.BookSeriesBase.YearTo
  ( YearTo(..)
  , yearToSchema
  ) where

import qualified Fleece.Core as FC
import Prelude (Eq, Integer, Show)

newtype YearTo = YearTo Integer
  deriving (Show, Eq)

yearToSchema :: FC.Fleece schema => schema YearTo
yearToSchema =
  FC.coerceSchema FC.integer