{-# LANGUAGE NoImplicitPrelude #-}

module TestCases.TopLevelArray
  ( TopLevelArray(..)
  , topLevelArraySchema
  ) where

import qualified Fleece.Core as FC
import Prelude (Eq, Show)
import qualified TestCases.TopLevelArray.TopLevelArrayItem as TopLevelArrayItem

newtype TopLevelArray = TopLevelArray [TopLevelArrayItem.TopLevelArrayItem]
  deriving (Show, Eq)

topLevelArraySchema :: FC.Fleece schema => schema TopLevelArray
topLevelArraySchema =
  FC.coerceSchema (FC.list TopLevelArrayItem.topLevelArrayItemSchema)