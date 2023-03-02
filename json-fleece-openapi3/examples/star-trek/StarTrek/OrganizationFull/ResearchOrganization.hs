{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.OrganizationFull.ResearchOrganization
  ( ResearchOrganization(..)
  , researchOrganizationSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype ResearchOrganization = ResearchOrganization Bool
  deriving (Show, Eq)

researchOrganizationSchema :: FC.Fleece schema => schema ResearchOrganization
researchOrganizationSchema =
  FC.coerceSchema FC.boolean