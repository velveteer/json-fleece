{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}

module StarTrek.Operations.ComicSeries.Search
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
import qualified StarTrek.Operations.ComicSeries.Search.ApiKey as ApiKey
import qualified StarTrek.Operations.ComicSeries.Search.PageNumber as PageNumber
import qualified StarTrek.Operations.ComicSeries.Search.PageSize as PageSize

data PathParams = PathParams
  deriving (Eq, Show)

route :: R.Router r => r PathParams
route =
  R.get $
    R.make PathParams
      /- "comicSeries"
      /- "search"

data QueryParams = QueryParams
  { apiKey :: Maybe ApiKey.ApiKey
  , pageNumber :: Maybe PageNumber.PageNumber
  , pageSize :: Maybe PageSize.PageSize
  }
  deriving (Eq, Show)

queryParamsSchema :: H.QuerySchema q => q QueryParams QueryParams
queryParamsSchema =
  H.makeQuery QueryParams
    ?+ H.optional apiKey ApiKey.paramDef
    ?+ H.optional pageNumber PageNumber.paramDef
    ?+ H.optional pageSize PageSize.paramDef