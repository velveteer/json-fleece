{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.MaterialBase
  ( MaterialBase(..)
  , materialBaseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.MaterialBase.AlloyOrComposite as AlloyOrComposite
import qualified StarTrek.MaterialBase.BiochemicalCompound as BiochemicalCompound
import qualified StarTrek.MaterialBase.ChemicalCompound as ChemicalCompound
import qualified StarTrek.MaterialBase.Drug as Drug
import qualified StarTrek.MaterialBase.Explosive as Explosive
import qualified StarTrek.MaterialBase.Fuel as Fuel
import qualified StarTrek.MaterialBase.Gemstone as Gemstone
import qualified StarTrek.MaterialBase.Mineral as Mineral
import qualified StarTrek.MaterialBase.Name as Name
import qualified StarTrek.MaterialBase.PoisonousSubstance as PoisonousSubstance
import qualified StarTrek.MaterialBase.PreciousMaterial as PreciousMaterial
import qualified StarTrek.MaterialBase.Uid as Uid

data MaterialBase = MaterialBase
  { mineral :: Maybe Mineral.Mineral -- ^ Whether it's a mineral
  , fuel :: Maybe Fuel.Fuel -- ^ Whether it's a fuel
  , name :: Name.Name -- ^ Material name
  , preciousMaterial :: Maybe PreciousMaterial.PreciousMaterial -- ^ Whether it's a precious material
  , explosive :: Maybe Explosive.Explosive -- ^ Whether it's an explosive
  , chemicalCompound :: Maybe ChemicalCompound.ChemicalCompound -- ^ Whether it's a chemical compound
  , uid :: Uid.Uid -- ^ Material unique ID
  , drug :: Maybe Drug.Drug -- ^ Whether it's a drug
  , biochemicalCompound :: Maybe BiochemicalCompound.BiochemicalCompound -- ^ Whether it's a biochemical compound
  , gemstone :: Maybe Gemstone.Gemstone -- ^ Whether it's a gemstone
  , poisonousSubstance :: Maybe PoisonousSubstance.PoisonousSubstance -- ^ Whether it's a poisonous substance
  , alloyOrComposite :: Maybe AlloyOrComposite.AlloyOrComposite -- ^ Whether it's an alloy or a composite
  }
  deriving (Eq, Show)

materialBaseSchema :: FC.Fleece schema => schema MaterialBase
materialBaseSchema =
  FC.object $
    FC.constructor MaterialBase
      #+ FC.optional "mineral" mineral Mineral.mineralSchema
      #+ FC.optional "fuel" fuel Fuel.fuelSchema
      #+ FC.required "name" name Name.nameSchema
      #+ FC.optional "preciousMaterial" preciousMaterial PreciousMaterial.preciousMaterialSchema
      #+ FC.optional "explosive" explosive Explosive.explosiveSchema
      #+ FC.optional "chemicalCompound" chemicalCompound ChemicalCompound.chemicalCompoundSchema
      #+ FC.required "uid" uid Uid.uidSchema
      #+ FC.optional "drug" drug Drug.drugSchema
      #+ FC.optional "biochemicalCompound" biochemicalCompound BiochemicalCompound.biochemicalCompoundSchema
      #+ FC.optional "gemstone" gemstone Gemstone.gemstoneSchema
      #+ FC.optional "poisonousSubstance" poisonousSubstance PoisonousSubstance.poisonousSubstanceSchema
      #+ FC.optional "alloyOrComposite" alloyOrComposite AlloyOrComposite.alloyOrCompositeSchema