{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.PerformerFull.PlaceOfBirth
  ( PlaceOfBirth(..)
  , placeOfBirthSchema
  ) where

import qualified Data.Text as T
import qualified Fleece.Core as FC
import Prelude (Eq, Show)

newtype PlaceOfBirth = PlaceOfBirth T.Text
  deriving (Show, Eq)

placeOfBirthSchema :: FC.Fleece schema => schema PlaceOfBirth
placeOfBirthSchema =
  FC.coerceSchema FC.text