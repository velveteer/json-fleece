{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.BookBase.EBook
  ( EBook(..)
  , eBookSchema
  ) where

import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype EBook = EBook Bool
  deriving (Show, Eq)

eBookSchema :: FC.Fleece schema => schema EBook
eBookSchema =
  FC.coerceSchema FC.boolean