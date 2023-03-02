{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.EpisodeBase.TitleGerman
  ( TitleGerman(..)
  , titleGermanSchema
  ) where

import Data.Text (Text)
import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Eq, Show)

newtype TitleGerman = TitleGerman Text
  deriving (Show, Eq)

titleGermanSchema :: FC.Fleece schema => schema TitleGerman
titleGermanSchema =
  FC.coerceSchema FC.text