{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.CharacterFull.YearOfDeath
  ( YearOfDeath(..)
  , yearOfDeathSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Eq, Integer, Show)

newtype YearOfDeath = YearOfDeath Integer
  deriving (Show, Eq)

yearOfDeathSchema :: FC.Fleece schema => schema YearOfDeath
yearOfDeathSchema =
  FC.coerceSchema FC.integer