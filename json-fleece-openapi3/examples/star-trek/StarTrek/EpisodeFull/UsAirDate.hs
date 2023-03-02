{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.EpisodeFull.UsAirDate
  ( UsAirDate(..)
  , usAirDateSchema
  ) where

import qualified Data.Time as Time
import qualified Fleece.Core as FC
import Prelude (Eq, Show)

newtype UsAirDate = UsAirDate Time.Day
  deriving (Show, Eq)

usAirDateSchema :: FC.Fleece schema => schema UsAirDate
usAirDateSchema =
  FC.coerceSchema FC.day