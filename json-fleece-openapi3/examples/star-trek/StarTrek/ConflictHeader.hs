{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.ConflictHeader
  ( ConflictHeader(..)
  , conflictHeaderSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Show)
import qualified StarTrek.ConflictHeader.Name as Name
import qualified StarTrek.ConflictHeader.Uid as Uid

data ConflictHeader = ConflictHeader
  { name :: Name.Name -- ^ Conflict name
  , uid :: Uid.Uid -- ^ Conflict unique ID
  }
  deriving (Eq, Show)

conflictHeaderSchema :: FC.Fleece schema => schema ConflictHeader
conflictHeaderSchema =
  FC.object $
    FC.constructor ConflictHeader
      #+ FC.required "name" name Name.nameSchema
      #+ FC.required "uid" uid Uid.uidSchema