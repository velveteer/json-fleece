{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.StaffFull.ProductionDesigner
  ( ProductionDesigner(..)
  , productionDesignerSchema
  ) where

import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype ProductionDesigner = ProductionDesigner Bool
  deriving (Show, Eq)

productionDesignerSchema :: FC.Fleece schema => schema ProductionDesigner
productionDesignerSchema =
  FC.coerceSchema FC.boolean