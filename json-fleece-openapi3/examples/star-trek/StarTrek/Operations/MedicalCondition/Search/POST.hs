{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}

module StarTrek.Operations.MedicalCondition.Search.POST
  ( operation
  , route
  , QueryParams(..)
  , queryParamsSchema
  , Responses(..)
  , responseSchemas
  ) where

import Beeline.HTTP.Client ((?+))
import qualified Beeline.HTTP.Client as H
import Beeline.Routing ((/-))
import qualified Beeline.Routing as R
import qualified Fleece.Aeson.Beeline as FA
import Prelude (($), Eq, Maybe, Show, fmap)
import qualified StarTrek.Operations.MedicalCondition.Search.POST.ApiKey as ApiKey
import qualified StarTrek.Operations.MedicalCondition.Search.POST.PageNumber as PageNumber
import qualified StarTrek.Operations.MedicalCondition.Search.POST.PageSize as PageSize
import qualified StarTrek.Operations.MedicalCondition.Search.POST.Sort as Sort
import qualified StarTrek.Types.MedicalConditionBaseResponse as MedicalConditionBaseResponse

operation ::
  H.Operation
    H.ContentTypeDecodingError
    H.NoPathParams
    QueryParams
    H.NoHeaderParams
    H.NoRequestBody
    Responses
operation =
  H.defaultOperation
    { H.requestRoute = route
    , H.requestQuerySchema = queryParamsSchema
    , H.responseSchemas = responseSchemas
    }

route :: R.Router r => r H.NoPathParams
route =
  R.post $
    R.make H.NoPathParams
      /- "medicalCondition"
      /- "search"

data QueryParams = QueryParams
  { apiKey :: Maybe ApiKey.ApiKey
  , pageNumber :: Maybe PageNumber.PageNumber
  , pageSize :: Maybe PageSize.PageSize
  , sort :: Maybe Sort.Sort
  }
  deriving (Eq, Show)

queryParamsSchema :: H.ParameterCollectionSchema p => p QueryParams QueryParams
queryParamsSchema =
  H.makeParams QueryParams
    ?+ H.optional apiKey ApiKey.paramDef
    ?+ H.optional pageNumber PageNumber.paramDef
    ?+ H.optional pageSize PageSize.paramDef
    ?+ H.optional sort Sort.paramDef

data Responses
  = Response200 MedicalConditionBaseResponse.MedicalConditionBaseResponse
  deriving (Eq, Show)

responseSchemas :: [(H.StatusRange, H.ResponseBodySchema H.ContentTypeDecodingError Responses)]
responseSchemas =
  [ (H.Status 200, fmap Response200 (H.responseBody FA.JSON MedicalConditionBaseResponse.medicalConditionBaseResponseSchema))
  ]