{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.ComicSeriesBase
  ( ComicSeriesBase(..)
  , comicSeriesBaseSchema
  ) where

import qualified Fleece.Core as FC
import Data.Scientific (Scientific)
import Data.Text (Text)
import Fleece.Core ((#+))
import Prelude (($), Bool, Eq, Integer, Maybe, Show)

data ComicSeriesBase = ComicSeriesBase
  { yearFrom :: Maybe Integer -- ^ Starting year of comic series stories
  , stardateTo :: Maybe Scientific -- ^ Ending stardate of comic series stories
  , publishedMonthFrom :: Maybe Integer -- ^ Month from which the comic series was published
  , publishedYearTo :: Maybe Integer -- ^ Year to which the comic series was published
  , uid :: Text -- ^ Comic series unique ID
  , stardateFrom :: Maybe Scientific -- ^ Starting stardate of comic series stories
  , numberOfIssues :: Maybe Integer -- ^ Number of issues
  , publishedYearFrom :: Maybe Integer -- ^ Year from which the comic series was published
  , title :: Text -- ^ Comic series title
  , publishedMonthTo :: Maybe Integer -- ^ Month to which the comic series was published
  , photonovelSeries :: Maybe Bool -- ^ Whether it's a photonovel series
  , miniseries :: Maybe Bool -- ^ Whether it's a miniseries
  , yearTo :: Maybe Integer -- ^ Ending year of comic series stories
  , publishedDayTo :: Maybe Integer -- ^ Day to which the comic series was published
  , publishedDayFrom :: Maybe Integer -- ^ Day from which the comic series was published
  }
  deriving (Eq, Show)

comicSeriesBaseSchema :: FC.Fleece schema => schema ComicSeriesBase
comicSeriesBaseSchema =
  FC.object $
    FC.constructor ComicSeriesBase
      #+ FC.optionalField FC.OmitKey_DelegateNull "yearFrom" yearFrom FC.integer
      #+ FC.optionalField FC.OmitKey_DelegateNull "stardateTo" stardateTo FC.number
      #+ FC.optionalField FC.OmitKey_DelegateNull "publishedMonthFrom" publishedMonthFrom FC.integer
      #+ FC.optionalField FC.OmitKey_DelegateNull "publishedYearTo" publishedYearTo FC.integer
      #+ FC.required "uid" uid FC.text
      #+ FC.optionalField FC.OmitKey_DelegateNull "stardateFrom" stardateFrom FC.number
      #+ FC.optionalField FC.OmitKey_DelegateNull "numberOfIssues" numberOfIssues FC.integer
      #+ FC.optionalField FC.OmitKey_DelegateNull "publishedYearFrom" publishedYearFrom FC.integer
      #+ FC.required "title" title FC.text
      #+ FC.optionalField FC.OmitKey_DelegateNull "publishedMonthTo" publishedMonthTo FC.integer
      #+ FC.optionalField FC.OmitKey_DelegateNull "photonovelSeries" photonovelSeries FC.boolean
      #+ FC.optionalField FC.OmitKey_DelegateNull "miniseries" miniseries FC.boolean
      #+ FC.optionalField FC.OmitKey_DelegateNull "yearTo" yearTo FC.integer
      #+ FC.optionalField FC.OmitKey_DelegateNull "publishedDayTo" publishedDayTo FC.integer
      #+ FC.optionalField FC.OmitKey_DelegateNull "publishedDayFrom" publishedDayFrom FC.integer