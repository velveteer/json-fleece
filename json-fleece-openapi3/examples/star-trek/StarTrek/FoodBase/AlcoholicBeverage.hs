{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.FoodBase.AlcoholicBeverage
  ( AlcoholicBeverage(..)
  , alcoholicBeverageSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype AlcoholicBeverage = AlcoholicBeverage Bool
  deriving (Show, Eq)

alcoholicBeverageSchema :: FC.Fleece schema => schema AlcoholicBeverage
alcoholicBeverageSchema =
  FC.coerceSchema FC.boolean