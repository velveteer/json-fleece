{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.PerformerBase.TngPerformer
  ( TngPerformer(..)
  , tngPerformerSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype TngPerformer = TngPerformer Bool
  deriving (Show, Eq)

tngPerformerSchema :: FC.Fleece schema => schema TngPerformer
tngPerformerSchema =
  FC.coerceSchema FC.boolean