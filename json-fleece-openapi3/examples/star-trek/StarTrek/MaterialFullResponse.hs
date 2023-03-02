{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.MaterialFullResponse
  ( MaterialFullResponse(..)
  , materialFullResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import StarTrek.MaterialFull (MaterialFull, materialFullSchema)

data MaterialFullResponse = MaterialFullResponse
  { material :: Maybe MaterialFull -- ^ Full material, returned when queried using UID
  }
  deriving (Eq, Show)

materialFullResponseSchema :: FC.Fleece schema => schema MaterialFullResponse
materialFullResponseSchema =
  FC.object $
    FC.constructor MaterialFullResponse
      #+ FC.optional "material" material materialFullSchema