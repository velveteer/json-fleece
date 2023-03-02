{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.SpeciesBaseResponse
  ( SpeciesBaseResponse(..)
  , speciesBaseResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.ResponsePage as ResponsePage
import qualified StarTrek.ResponseSort as ResponseSort
import qualified StarTrek.SpeciesBase as SpeciesBase

data SpeciesBaseResponse = SpeciesBaseResponse
  { sort :: Maybe ResponseSort.ResponseSort -- ^ Response sort
  , species :: Maybe [SpeciesBase.SpeciesBase] -- ^ Base species, returned in search results
  , page :: Maybe ResponsePage.ResponsePage -- ^ Object describing response page
  }
  deriving (Eq, Show)

speciesBaseResponseSchema :: FC.Fleece schema => schema SpeciesBaseResponse
speciesBaseResponseSchema =
  FC.object $
    FC.constructor SpeciesBaseResponse
      #+ FC.optional "sort" sort ResponseSort.responseSortSchema
      #+ FC.optional "species" species (FC.list SpeciesBase.speciesBaseSchema)
      #+ FC.optional "page" page ResponsePage.responsePageSchema