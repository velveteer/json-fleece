{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.SpeciesFull.WarpCapableSpecies
  ( WarpCapableSpecies(..)
  , warpCapableSpeciesSchema
  ) where

import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype WarpCapableSpecies = WarpCapableSpecies Bool
  deriving (Show, Eq)

warpCapableSpeciesSchema :: FC.Fleece schema => schema WarpCapableSpecies
warpCapableSpeciesSchema =
  FC.coerceSchema FC.boolean