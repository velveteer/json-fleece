{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.VideoReleaseBase.NumberOfFeatureLengthEpisodes
  ( NumberOfFeatureLengthEpisodes(..)
  , numberOfFeatureLengthEpisodesSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Eq, Integer, Show)

newtype NumberOfFeatureLengthEpisodes = NumberOfFeatureLengthEpisodes Integer
  deriving (Show, Eq)

numberOfFeatureLengthEpisodesSchema :: FC.Fleece schema => schema NumberOfFeatureLengthEpisodes
numberOfFeatureLengthEpisodesSchema =
  FC.coerceSchema FC.integer