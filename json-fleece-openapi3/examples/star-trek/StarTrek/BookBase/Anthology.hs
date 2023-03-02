{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.BookBase.Anthology
  ( Anthology(..)
  , anthologySchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype Anthology = Anthology Bool
  deriving (Show, Eq)

anthologySchema :: FC.Fleece schema => schema Anthology
anthologySchema =
  FC.coerceSchema FC.boolean