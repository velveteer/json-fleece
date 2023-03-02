{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.StaffFull.SpecialFeaturesStaff
  ( SpecialFeaturesStaff(..)
  , specialFeaturesStaffSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype SpecialFeaturesStaff = SpecialFeaturesStaff Bool
  deriving (Show, Eq)

specialFeaturesStaffSchema :: FC.Fleece schema => schema SpecialFeaturesStaff
specialFeaturesStaffSchema =
  FC.coerceSchema FC.boolean