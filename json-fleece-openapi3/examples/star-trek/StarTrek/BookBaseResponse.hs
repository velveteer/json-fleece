{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.BookBaseResponse
  ( BookBaseResponse(..)
  , bookBaseResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import StarTrek.BookBase (BookBase, bookBaseSchema)
import StarTrek.ResponsePage (ResponsePage, responsePageSchema)
import StarTrek.ResponseSort (ResponseSort, responseSortSchema)

data BookBaseResponse = BookBaseResponse
  { books :: Maybe [BookBase] -- ^ Base book, returned in search results
  , sort :: Maybe ResponseSort -- ^ Response sort
  , page :: Maybe ResponsePage -- ^ Object describing response page
  }
  deriving (Eq, Show)

bookBaseResponseSchema :: FC.Fleece schema => schema BookBaseResponse
bookBaseResponseSchema =
  FC.object $
    FC.constructor BookBaseResponse
      #+ FC.optional "books" books (FC.list bookBaseSchema)
      #+ FC.optional "sort" sort responseSortSchema
      #+ FC.optional "page" page responsePageSchema