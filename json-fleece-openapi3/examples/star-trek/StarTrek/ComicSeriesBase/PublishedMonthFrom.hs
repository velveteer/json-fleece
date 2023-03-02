{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.ComicSeriesBase.PublishedMonthFrom
  ( PublishedMonthFrom(..)
  , publishedMonthFromSchema
  ) where

import qualified Fleece.Core as FC
import Prelude (Eq, Integer, Show)

newtype PublishedMonthFrom = PublishedMonthFrom Integer
  deriving (Show, Eq)

publishedMonthFromSchema :: FC.Fleece schema => schema PublishedMonthFrom
publishedMonthFromSchema =
  FC.coerceSchema FC.integer