{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.VideoReleaseBase.VuduDigitalRelease
  ( VuduDigitalRelease(..)
  , vuduDigitalReleaseSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype VuduDigitalRelease = VuduDigitalRelease Bool
  deriving (Show, Eq)

vuduDigitalReleaseSchema :: FC.Fleece schema => schema VuduDigitalRelease
vuduDigitalReleaseSchema =
  FC.coerceSchema FC.boolean