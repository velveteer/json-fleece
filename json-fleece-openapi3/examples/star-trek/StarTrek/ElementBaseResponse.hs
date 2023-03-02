{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.ElementBaseResponse
  ( ElementBaseResponse(..)
  , elementBaseResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.ElementBase as ElementBase
import qualified StarTrek.ResponsePage as ResponsePage
import qualified StarTrek.ResponseSort as ResponseSort

data ElementBaseResponse = ElementBaseResponse
  { sort :: Maybe ResponseSort.ResponseSort -- ^ Response sort
  , page :: Maybe ResponsePage.ResponsePage -- ^ Object describing response page
  , elements :: Maybe [ElementBase.ElementBase] -- ^ Base element, returned in search results
  }
  deriving (Eq, Show)

elementBaseResponseSchema :: FC.Fleece schema => schema ElementBaseResponse
elementBaseResponseSchema =
  FC.object $
    FC.constructor ElementBaseResponse
      #+ FC.optional "sort" sort ResponseSort.responseSortSchema
      #+ FC.optional "page" page ResponsePage.responsePageSchema
      #+ FC.optional "elements" elements (FC.list ElementBase.elementBaseSchema)