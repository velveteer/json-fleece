{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.ResponseSortDirection
  ( ResponseSortDirection(..)
  , responseSortDirectionSchema
  ) where

import Data.Text (Text, pack)
import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (($), Bounded, Enum, Eq, Ord, Show)

data ResponseSortDirection
  = ASC
  | DESC
  deriving (Eq, Show, Ord, Enum, Bounded)

responseSortDirectionToText :: ResponseSortDirection -> Text
responseSortDirectionToText v =
  pack $
    case v of
      ASC -> "ASC"
      DESC -> "DESC"

responseSortDirectionSchema :: FC.Fleece schema => schema ResponseSortDirection
responseSortDirectionSchema =
  FC.boundedEnum responseSortDirectionToText