{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.TechnologyHeader
  ( TechnologyHeader(..)
  , technologyHeaderSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Show)
import qualified StarTrek.TechnologyHeader.Name as Name
import qualified StarTrek.TechnologyHeader.Uid as Uid

data TechnologyHeader = TechnologyHeader
  { name :: Name.Name -- ^ Technology name
  , uid :: Uid.Uid -- ^ Technology unique ID
  }
  deriving (Eq, Show)

technologyHeaderSchema :: FC.Fleece schema => schema TechnologyHeader
technologyHeaderSchema =
  FC.object $
    FC.constructor TechnologyHeader
      #+ FC.required "name" name Name.nameSchema
      #+ FC.required "uid" uid Uid.uidSchema