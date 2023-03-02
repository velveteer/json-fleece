{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.CompanyBase.Broadcaster
  ( Broadcaster(..)
  , broadcasterSchema
  ) where

import Fleece.Core ()
import qualified Fleece.Core as FC
import Prelude (Bool, Eq, Show)

newtype Broadcaster = Broadcaster Bool
  deriving (Show, Eq)

broadcasterSchema :: FC.Fleece schema => schema Broadcaster
broadcasterSchema =
  FC.coerceSchema FC.boolean