{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.MovieBase.TitleSerbian
  ( TitleSerbian(..)
  , titleSerbianSchema
  ) where

import qualified Data.Text as T
import qualified Fleece.Core as FC
import Prelude (Eq, Show)

newtype TitleSerbian = TitleSerbian T.Text
  deriving (Show, Eq)

titleSerbianSchema :: FC.Fleece schema => schema TitleSerbian
titleSerbianSchema =
  FC.coerceSchema FC.text