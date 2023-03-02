{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.SpeciesHeader
  ( SpeciesHeader(..)
  , speciesHeaderSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Show)
import qualified StarTrek.SpeciesHeader.Name as Name
import qualified StarTrek.SpeciesHeader.Uid as Uid

data SpeciesHeader = SpeciesHeader
  { name :: Name.Name -- ^ Species name
  , uid :: Uid.Uid -- ^ Species unique ID
  }
  deriving (Eq, Show)

speciesHeaderSchema :: FC.Fleece schema => schema SpeciesHeader
speciesHeaderSchema =
  FC.object $
    FC.constructor SpeciesHeader
      #+ FC.required "name" name Name.nameSchema
      #+ FC.required "uid" uid Uid.uidSchema