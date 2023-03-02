{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.MagazineBase.CoverMonth
  ( CoverMonth(..)
  , coverMonthSchema
  ) where

import qualified Fleece.Core as FC
import Prelude (Eq, Integer, Show)

newtype CoverMonth = CoverMonth Integer
  deriving (Show, Eq)

coverMonthSchema :: FC.Fleece schema => schema CoverMonth
coverMonthSchema =
  FC.coerceSchema FC.integer