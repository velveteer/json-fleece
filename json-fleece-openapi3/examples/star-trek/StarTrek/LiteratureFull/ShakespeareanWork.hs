{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.LiteratureFull.ShakespeareanWork
  ( ShakespeareanWork(..)
  , shakespeareanWorkSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype ShakespeareanWork = ShakespeareanWork Bool
  deriving (Show, Eq)

shakespeareanWorkSchema :: FC.Fleece schema => schema ShakespeareanWork
shakespeareanWorkSchema =
  FC.coerceSchema FC.boolean