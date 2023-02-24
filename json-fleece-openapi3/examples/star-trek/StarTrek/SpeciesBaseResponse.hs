{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.SpeciesBaseResponse
  ( SpeciesBaseResponse(..)
  , speciesBaseResponseSchema
  ) where

import qualified Fleece.Core as FC
import Fleece.Core ((#+))
import Prelude (($), Eq, Maybe, Show)
import StarTrek.ResponsePage (ResponsePage, responsePageSchema)
import StarTrek.ResponseSort (ResponseSort, responseSortSchema)
import StarTrek.SpeciesBase (SpeciesBase, speciesBaseSchema)

data SpeciesBaseResponse = SpeciesBaseResponse
  { sort :: Maybe ResponseSort -- ^ Response sort
  , species :: Maybe [SpeciesBase] -- ^ List of species matching given criteria
  , page :: Maybe ResponsePage -- ^ Object describing response page
  }
  deriving (Eq, Show)

speciesBaseResponseSchema :: FC.Fleece schema => schema SpeciesBaseResponse
speciesBaseResponseSchema =
  FC.object $
    FC.constructor SpeciesBaseResponse
      #+ FC.optionalField FC.OmitKey_DelegateNull "sort" sort responseSortSchema
      #+ FC.optionalField FC.OmitKey_DelegateNull "species" species (FC.list speciesBaseSchema)
      #+ FC.optionalField FC.OmitKey_DelegateNull "page" page responsePageSchema