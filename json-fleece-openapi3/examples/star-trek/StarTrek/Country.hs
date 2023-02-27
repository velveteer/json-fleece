{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.Country
  ( Country(..)
  , countrySchema
  ) where

import Data.Text (Text)
import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)

data Country = Country
  { name :: Maybe Text -- ^ Country name
  , uid :: Maybe Text -- ^ Country unique ID
  , iso31661Alpha2Code :: Maybe Text -- ^ ISO 3166-1 alpha-2 code
  }
  deriving (Eq, Show)

countrySchema :: FC.Fleece schema => schema Country
countrySchema =
  FC.object $
    FC.constructor Country
      #+ FC.optional "name" name FC.text
      #+ FC.optional "uid" uid FC.text
      #+ FC.optional "iso31661Alpha2Code" iso31661Alpha2Code FC.text