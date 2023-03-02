{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.ComicSeriesBaseResponse
  ( ComicSeriesBaseResponse(..)
  , comicSeriesBaseResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.ComicSeriesBase as ComicSeriesBase
import qualified StarTrek.ResponsePage as ResponsePage
import qualified StarTrek.ResponseSort as ResponseSort

data ComicSeriesBaseResponse = ComicSeriesBaseResponse
  { sort :: Maybe ResponseSort.ResponseSort -- ^ Response sort
  , comicSeries :: Maybe [ComicSeriesBase.ComicSeriesBase] -- ^ Base comic series, returned in search results
  , page :: Maybe ResponsePage.ResponsePage -- ^ Object describing response page
  }
  deriving (Eq, Show)

comicSeriesBaseResponseSchema :: FC.Fleece schema => schema ComicSeriesBaseResponse
comicSeriesBaseResponseSchema =
  FC.object $
    FC.constructor ComicSeriesBaseResponse
      #+ FC.optional "sort" sort ResponseSort.responseSortSchema
      #+ FC.optional "comicSeries" comicSeries (FC.list ComicSeriesBase.comicSeriesBaseSchema)
      #+ FC.optional "page" page ResponsePage.responsePageSchema