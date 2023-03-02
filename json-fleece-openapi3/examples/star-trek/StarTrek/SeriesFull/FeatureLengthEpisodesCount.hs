{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.SeriesFull.FeatureLengthEpisodesCount
  ( FeatureLengthEpisodesCount(..)
  , featureLengthEpisodesCountSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Eq, Integer, Show)

newtype FeatureLengthEpisodesCount = FeatureLengthEpisodesCount Integer
  deriving (Show, Eq)

featureLengthEpisodesCountSchema :: FC.Fleece schema => schema FeatureLengthEpisodesCount
featureLengthEpisodesCountSchema =
  FC.coerceSchema FC.integer