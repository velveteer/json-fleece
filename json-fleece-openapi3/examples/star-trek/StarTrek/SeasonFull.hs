{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.SeasonFull
  ( SeasonFull(..)
  , seasonFullSchema
  ) where

import qualified Fleece.Core as FC
import Data.Text (Text)
import Fleece.Core ((#+))
import Prelude (($), Eq, Integer, Maybe, Show)
import StarTrek.EpisodeBase (EpisodeBase, episodeBaseSchema)
import StarTrek.SeriesBase (SeriesBase, seriesBaseSchema)

data SeasonFull = SeasonFull
  { uid :: Text -- ^ Season unique ID
  , episodes :: Maybe [EpisodeBase] -- ^ Episodes in this season
  , title :: Text -- ^ Season title
  , series :: Maybe SeriesBase -- ^ Base series, returned in search results
  , seasonNumber :: Maybe Integer -- ^ Season number in series
  , numberOfEpisodes :: Maybe Integer -- ^ Number of episodes in this season
  }
  deriving (Eq, Show)

seasonFullSchema :: FC.Fleece schema => schema SeasonFull
seasonFullSchema =
  FC.object $
    FC.constructor SeasonFull
      #+ FC.required "uid" uid FC.text
      #+ FC.optionalField FC.OmitKey_DelegateNull "episodes" episodes (FC.list episodeBaseSchema)
      #+ FC.required "title" title FC.text
      #+ FC.optionalField FC.OmitKey_DelegateNull "series" series seriesBaseSchema
      #+ FC.optionalField FC.OmitKey_DelegateNull "seasonNumber" seasonNumber FC.integer
      #+ FC.optionalField FC.OmitKey_DelegateNull "numberOfEpisodes" numberOfEpisodes FC.integer