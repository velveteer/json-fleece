{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.CharacterBase.MonthOfDeath
  ( MonthOfDeath(..)
  , monthOfDeathSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Eq, Integer, Show)

newtype MonthOfDeath = MonthOfDeath Integer
  deriving (Show, Eq)

monthOfDeathSchema :: FC.Fleece schema => schema MonthOfDeath
monthOfDeathSchema =
  FC.coerceSchema FC.integer