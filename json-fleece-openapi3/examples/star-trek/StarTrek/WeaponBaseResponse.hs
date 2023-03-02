{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.WeaponBaseResponse
  ( WeaponBaseResponse(..)
  , weaponBaseResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import StarTrek.ResponsePage (ResponsePage, responsePageSchema)
import StarTrek.ResponseSort (ResponseSort, responseSortSchema)
import StarTrek.WeaponBase (WeaponBase, weaponBaseSchema)

data WeaponBaseResponse = WeaponBaseResponse
  { sort :: Maybe ResponseSort -- ^ Response sort
  , weapons :: Maybe [WeaponBase] -- ^ Base weapon, returned in search results
  , page :: Maybe ResponsePage -- ^ Object describing response page
  }
  deriving (Eq, Show)

weaponBaseResponseSchema :: FC.Fleece schema => schema WeaponBaseResponse
weaponBaseResponseSchema =
  FC.object $
    FC.constructor WeaponBaseResponse
      #+ FC.optional "sort" sort responseSortSchema
      #+ FC.optional "weapons" weapons (FC.list weaponBaseSchema)
      #+ FC.optional "page" page responsePageSchema