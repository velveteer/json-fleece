{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.OccupationFullResponse
  ( OccupationFullResponse(..)
  , occupationFullResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import StarTrek.OccupationFull (OccupationFull, occupationFullSchema)

data OccupationFullResponse = OccupationFullResponse
  { occupation :: Maybe OccupationFull -- ^ Full occupation, returned when queried using UID
  }
  deriving (Eq, Show)

occupationFullResponseSchema :: FC.Fleece schema => schema OccupationFullResponse
occupationFullResponseSchema =
  FC.object $
    FC.constructor OccupationFullResponse
      #+ FC.optional "occupation" occupation occupationFullSchema