{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}

module StarTrek.Operations.Soundtrack
  ( PathParams(..)
  , route
  , QueryParams(..)
  , queryParamsSchema
  ) where

import Beeline.HTTP.Client ((?+))
import qualified Beeline.HTTP.Client as H
import Beeline.Routing ((/-))
import qualified Beeline.Routing as R
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.Operations.Soundtrack.ApiKey as ApiKey
import qualified StarTrek.Operations.Soundtrack.Uid as Uid

data PathParams = PathParams
  deriving (Eq, Show)

route :: R.Router r => r PathParams
route =
  R.get $
    R.make PathParams
      /- "soundtrack"

data QueryParams = QueryParams
  { apiKey :: Maybe ApiKey.ApiKey
  , uid :: Uid.Uid
  }
  deriving (Eq, Show)

queryParamsSchema :: H.QuerySchema q => q QueryParams QueryParams
queryParamsSchema =
  H.makeQuery QueryParams
    ?+ H.optional apiKey ApiKey.paramDef
    ?+ H.required uid Uid.paramDef