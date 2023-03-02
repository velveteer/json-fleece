{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.OrganizationBase.MilitaryOrganization
  ( MilitaryOrganization(..)
  , militaryOrganizationSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype MilitaryOrganization = MilitaryOrganization Bool
  deriving (Show, Eq)

militaryOrganizationSchema :: FC.Fleece schema => schema MilitaryOrganization
militaryOrganizationSchema =
  FC.coerceSchema FC.boolean