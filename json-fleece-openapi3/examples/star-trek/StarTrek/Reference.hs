{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Reference
  ( Reference(..)
  , referenceSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.Reference.ReferenceNumber as ReferenceNumber
import qualified StarTrek.Reference.Uid as Uid
import qualified StarTrek.ReferenceType as ReferenceType

data Reference = Reference
  { referenceNumber :: Maybe ReferenceNumber.ReferenceNumber -- ^ Reference number
  , uid :: Maybe Uid.Uid -- ^ Reference unique ID
  , referenceType :: Maybe ReferenceType.ReferenceType -- ^ Reference type
  }
  deriving (Eq, Show)

referenceSchema :: FC.Fleece schema => schema Reference
referenceSchema =
  FC.object $
    FC.constructor Reference
      #+ FC.optional "referenceNumber" referenceNumber ReferenceNumber.referenceNumberSchema
      #+ FC.optional "uid" uid Uid.uidSchema
      #+ FC.optional "referenceType" referenceType ReferenceType.referenceTypeSchema