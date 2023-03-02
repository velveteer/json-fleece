{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.LocationFull
  ( LocationFull(..)
  , locationFullSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import StarTrek.LocationFull.AlternateReality (AlternateReality, alternateRealitySchema)
import StarTrek.LocationFull.BajoranSettlement (BajoranSettlement, bajoranSettlementSchema)
import StarTrek.LocationFull.BodyOfWater (BodyOfWater, bodyOfWaterSchema)
import StarTrek.LocationFull.BuildingInterior (BuildingInterior, buildingInteriorSchema)
import StarTrek.LocationFull.Colony (Colony, colonySchema)
import StarTrek.LocationFull.Country (Country, countrySchema)
import StarTrek.LocationFull.Ds9Establishment (Ds9Establishment, ds9EstablishmentSchema)
import StarTrek.LocationFull.EarthlyLocation (EarthlyLocation, earthlyLocationSchema)
import StarTrek.LocationFull.Establishment (Establishment, establishmentSchema)
import StarTrek.LocationFull.FictionalLocation (FictionalLocation, fictionalLocationSchema)
import StarTrek.LocationFull.GeographicalLocation (GeographicalLocation, geographicalLocationSchema)
import StarTrek.LocationFull.Landform (Landform, landformSchema)
import StarTrek.LocationFull.Landmark (Landmark, landmarkSchema)
import StarTrek.LocationFull.MedicalEstablishment (MedicalEstablishment, medicalEstablishmentSchema)
import StarTrek.LocationFull.Mirror (Mirror, mirrorSchema)
import StarTrek.LocationFull.Name (Name, nameSchema)
import StarTrek.LocationFull.ReligiousLocation (ReligiousLocation, religiousLocationSchema)
import StarTrek.LocationFull.Road (Road, roadSchema)
import StarTrek.LocationFull.School (School, schoolSchema)
import StarTrek.LocationFull.Settlement (Settlement, settlementSchema)
import StarTrek.LocationFull.Shipyard (Shipyard, shipyardSchema)
import StarTrek.LocationFull.Structure (Structure, structureSchema)
import StarTrek.LocationFull.SubnationalEntity (SubnationalEntity, subnationalEntitySchema)
import StarTrek.LocationFull.Uid (Uid, uidSchema)
import StarTrek.LocationFull.UsSettlement (UsSettlement, usSettlementSchema)

data LocationFull = LocationFull
  { bodyOfWater :: Maybe BodyOfWater -- ^ Whether it's a body of water
  , establishment :: Maybe Establishment -- ^ Whether it's a establishment
  , alternateReality :: Maybe AlternateReality -- ^ Whether this location is from alternate reality
  , name :: Name -- ^ Location name
  , fictionalLocation :: Maybe FictionalLocation -- ^ Whether it's a fictional location
  , usSettlement :: Maybe UsSettlement -- ^ Whether it's a US settlement
  , country :: Maybe Country -- ^ Whether it's a country
  , colony :: Maybe Colony -- ^ Whether it's a colony
  , ds9Establishment :: Maybe Ds9Establishment -- ^ Whether it's a DS9 establishment
  , road :: Maybe Road -- ^ Whether it's a road
  , uid :: Uid -- ^ Location unique ID
  , medicalEstablishment :: Maybe MedicalEstablishment -- ^ Whether it's a medical establishment
  , earthlyLocation :: Maybe EarthlyLocation -- ^ Whether it's an earthly location
  , mirror :: Maybe Mirror -- ^ Whether this location is from mirror universe
  , settlement :: Maybe Settlement -- ^ Whether it's a settlement
  , buildingInterior :: Maybe BuildingInterior -- ^ Whether it's a building interior
  , subnationalEntity :: Maybe SubnationalEntity -- ^ Whether it's a subnational entity
  , landform :: Maybe Landform -- ^ Whether it's a landform
  , school :: Maybe School -- ^ Whether it's a school
  , landmark :: Maybe Landmark -- ^ Whether it's a landmark
  , religiousLocation :: Maybe ReligiousLocation -- ^ Whether it's a religious location
  , geographicalLocation :: Maybe GeographicalLocation -- ^ Whether it's a geographical location
  , shipyard :: Maybe Shipyard -- ^ Whether it's a shipyard
  , bajoranSettlement :: Maybe BajoranSettlement -- ^ Whether it's a Bajoran settlement
  , structure :: Maybe Structure -- ^ Whether it's a structure
  }
  deriving (Eq, Show)

locationFullSchema :: FC.Fleece schema => schema LocationFull
locationFullSchema =
  FC.object $
    FC.constructor LocationFull
      #+ FC.optional "bodyOfWater" bodyOfWater bodyOfWaterSchema
      #+ FC.optional "establishment" establishment establishmentSchema
      #+ FC.optional "alternateReality" alternateReality alternateRealitySchema
      #+ FC.required "name" name nameSchema
      #+ FC.optional "fictionalLocation" fictionalLocation fictionalLocationSchema
      #+ FC.optional "usSettlement" usSettlement usSettlementSchema
      #+ FC.optional "country" country countrySchema
      #+ FC.optional "colony" colony colonySchema
      #+ FC.optional "ds9Establishment" ds9Establishment ds9EstablishmentSchema
      #+ FC.optional "road" road roadSchema
      #+ FC.required "uid" uid uidSchema
      #+ FC.optional "medicalEstablishment" medicalEstablishment medicalEstablishmentSchema
      #+ FC.optional "earthlyLocation" earthlyLocation earthlyLocationSchema
      #+ FC.optional "mirror" mirror mirrorSchema
      #+ FC.optional "settlement" settlement settlementSchema
      #+ FC.optional "buildingInterior" buildingInterior buildingInteriorSchema
      #+ FC.optional "subnationalEntity" subnationalEntity subnationalEntitySchema
      #+ FC.optional "landform" landform landformSchema
      #+ FC.optional "school" school schoolSchema
      #+ FC.optional "landmark" landmark landmarkSchema
      #+ FC.optional "religiousLocation" religiousLocation religiousLocationSchema
      #+ FC.optional "geographicalLocation" geographicalLocation geographicalLocationSchema
      #+ FC.optional "shipyard" shipyard shipyardSchema
      #+ FC.optional "bajoranSettlement" bajoranSettlement bajoranSettlementSchema
      #+ FC.optional "structure" structure structureSchema