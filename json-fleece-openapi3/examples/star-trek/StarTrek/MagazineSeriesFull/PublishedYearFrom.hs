{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.MagazineSeriesFull.PublishedYearFrom
  ( PublishedYearFrom(..)
  , publishedYearFromSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Eq, Integer, Show)

newtype PublishedYearFrom = PublishedYearFrom Integer
  deriving (Show, Eq)

publishedYearFromSchema :: FC.Fleece schema => schema PublishedYearFrom
publishedYearFromSchema =
  FC.coerceSchema FC.integer