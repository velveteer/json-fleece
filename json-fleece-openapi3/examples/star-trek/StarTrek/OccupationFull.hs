{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.OccupationFull
  ( OccupationFull(..)
  , occupationFullSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.CharacterBase as CharacterBase
import qualified StarTrek.OccupationFull.LegalOccupation as LegalOccupation
import qualified StarTrek.OccupationFull.MedicalOccupation as MedicalOccupation
import qualified StarTrek.OccupationFull.Name as Name
import qualified StarTrek.OccupationFull.ScientificOccupation as ScientificOccupation
import qualified StarTrek.OccupationFull.Uid as Uid

data OccupationFull = OccupationFull
  { medicalOccupation :: Maybe MedicalOccupation.MedicalOccupation -- ^ Whether it's a medical occupation
  , name :: Name.Name -- ^ Occupation name
  , uid :: Uid.Uid -- ^ Occupation unique ID
  , characters :: Maybe [CharacterBase.CharacterBase] -- ^ Base character, returned in search results
  , legalOccupation :: Maybe LegalOccupation.LegalOccupation -- ^ Whether it's a legal occupation
  , scientificOccupation :: Maybe ScientificOccupation.ScientificOccupation -- ^ Whether it's a scientific occupation
  }
  deriving (Eq, Show)

occupationFullSchema :: FC.Fleece schema => schema OccupationFull
occupationFullSchema =
  FC.object $
    FC.constructor OccupationFull
      #+ FC.optional "medicalOccupation" medicalOccupation MedicalOccupation.medicalOccupationSchema
      #+ FC.required "name" name Name.nameSchema
      #+ FC.required "uid" uid Uid.uidSchema
      #+ FC.optional "characters" characters (FC.list CharacterBase.characterBaseSchema)
      #+ FC.optional "legalOccupation" legalOccupation LegalOccupation.legalOccupationSchema
      #+ FC.optional "scientificOccupation" scientificOccupation ScientificOccupation.scientificOccupationSchema