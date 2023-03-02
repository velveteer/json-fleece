{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.BookFullResponse
  ( BookFullResponse(..)
  , bookFullResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import StarTrek.BookFull (BookFull, bookFullSchema)

data BookFullResponse = BookFullResponse
  { book :: Maybe BookFull -- ^ Full book, returned when queried using UID
  }
  deriving (Eq, Show)

bookFullResponseSchema :: FC.Fleece schema => schema BookFullResponse
bookFullResponseSchema =
  FC.object $
    FC.constructor BookFullResponse
      #+ FC.optional "book" book bookFullSchema