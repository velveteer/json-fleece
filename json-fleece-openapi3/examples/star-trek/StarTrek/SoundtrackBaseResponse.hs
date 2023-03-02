{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.SoundtrackBaseResponse
  ( SoundtrackBaseResponse(..)
  , soundtrackBaseResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import StarTrek.ResponsePage (ResponsePage, responsePageSchema)
import StarTrek.ResponseSort (ResponseSort, responseSortSchema)
import StarTrek.SoundtrackBase (SoundtrackBase, soundtrackBaseSchema)

data SoundtrackBaseResponse = SoundtrackBaseResponse
  { sort :: Maybe ResponseSort -- ^ Response sort
  , soundtracks :: Maybe [SoundtrackBase] -- ^ Base soundtrack, returned in search results
  , page :: Maybe ResponsePage -- ^ Object describing response page
  }
  deriving (Eq, Show)

soundtrackBaseResponseSchema :: FC.Fleece schema => schema SoundtrackBaseResponse
soundtrackBaseResponseSchema =
  FC.object $
    FC.constructor SoundtrackBaseResponse
      #+ FC.optional "sort" sort responseSortSchema
      #+ FC.optional "soundtracks" soundtracks (FC.list soundtrackBaseSchema)
      #+ FC.optional "page" page responsePageSchema