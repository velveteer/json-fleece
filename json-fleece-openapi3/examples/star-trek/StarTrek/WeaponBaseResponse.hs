{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.WeaponBaseResponse
  ( WeaponBaseResponse(..)
  , weaponBaseResponseSchema
  ) where

import qualified Fleece.Core as FC
import Fleece.Core ((#+))
import Prelude (($), Eq, Maybe, Show)
import StarTrek.ResponsePage (ResponsePage, responsePageSchema)
import StarTrek.ResponseSort (ResponseSort, responseSortSchema)
import StarTrek.WeaponBase (WeaponBase, weaponBaseSchema)

data WeaponBaseResponse = WeaponBaseResponse
  { sort :: Maybe ResponseSort -- ^ Response sort
  , weapons :: Maybe [WeaponBase] -- ^ List of weapons matching given criteria
  , page :: Maybe ResponsePage -- ^ Object describing response page
  }
  deriving (Eq, Show)

weaponBaseResponseSchema :: FC.Fleece schema => schema WeaponBaseResponse
weaponBaseResponseSchema =
  FC.object $
    FC.constructor WeaponBaseResponse
      #+ FC.optionalField FC.OmitKey_DelegateNull "sort" sort responseSortSchema
      #+ FC.optionalField FC.OmitKey_DelegateNull "weapons" weapons (FC.list weaponBaseSchema)
      #+ FC.optionalField FC.OmitKey_DelegateNull "page" page responsePageSchema