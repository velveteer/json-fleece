{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.CompanyFullResponse
  ( CompanyFullResponse(..)
  , companyFullResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import StarTrek.CompanyFull (CompanyFull, companyFullSchema)

data CompanyFullResponse = CompanyFullResponse
  { company :: Maybe CompanyFull -- ^ Full company, returned when queried using UID
  }
  deriving (Eq, Show)

companyFullResponseSchema :: FC.Fleece schema => schema CompanyFullResponse
companyFullResponseSchema =
  FC.object $
    FC.constructor CompanyFullResponse
      #+ FC.optional "company" company companyFullSchema