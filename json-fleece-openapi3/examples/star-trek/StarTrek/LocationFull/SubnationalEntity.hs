{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.LocationFull.SubnationalEntity
  ( SubnationalEntity(..)
  , subnationalEntitySchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype SubnationalEntity = SubnationalEntity Bool
  deriving (Show, Eq)

subnationalEntitySchema :: FC.Fleece schema => schema SubnationalEntity
subnationalEntitySchema =
  FC.coerceSchema FC.boolean