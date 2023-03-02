{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.LocationFull.EarthlyLocation
  ( EarthlyLocation(..)
  , earthlyLocationSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype EarthlyLocation = EarthlyLocation Bool
  deriving (Show, Eq)

earthlyLocationSchema :: FC.Fleece schema => schema EarthlyLocation
earthlyLocationSchema =
  FC.coerceSchema FC.boolean