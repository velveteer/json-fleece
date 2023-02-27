{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.VideoGameFull
  ( VideoGameFull(..)
  , videoGameFullSchema
  ) where

import Data.Text (Text)
import Data.Time (Day)
import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Float, Integer, Maybe, Show)
import StarTrek.CompanyBase (CompanyBase, companyBaseSchema)
import StarTrek.ContentRating (ContentRating, contentRatingSchema)
import StarTrek.Genre (Genre, genreSchema)
import StarTrek.Platform (Platform, platformSchema)
import StarTrek.Reference (Reference, referenceSchema)

data VideoGameFull = VideoGameFull
  { yearFrom :: Maybe Integer -- ^ Starting year of video game story
  , stardateTo :: Maybe Float -- ^ Ending stardate of video game story
  , publishers :: Maybe [CompanyBase] -- ^ Publishers
  , systemRequirements :: Maybe Text -- ^ System requirements
  , releaseDate :: Maybe Day -- ^ Release date
  , uid :: Text -- ^ Video game unique ID
  , ratings :: Maybe [ContentRating] -- ^ Ratings
  , stardateFrom :: Maybe Float -- ^ Starting stardate of video game story
  , genres :: Maybe [Genre] -- ^ Genres
  , title :: Text -- ^ Video game title
  , references :: Maybe [Reference] -- ^ References
  , yearTo :: Maybe Integer -- ^ Ending year of video game story
  , developers :: Maybe [CompanyBase] -- ^ Developers
  , platforms :: Maybe [Platform] -- ^ Platforms
  }
  deriving (Eq, Show)

videoGameFullSchema :: FC.Fleece schema => schema VideoGameFull
videoGameFullSchema =
  FC.object $
    FC.constructor VideoGameFull
      #+ FC.optional "yearFrom" yearFrom FC.integer
      #+ FC.optional "stardateTo" stardateTo FC.float
      #+ FC.optional "publishers" publishers (FC.list companyBaseSchema)
      #+ FC.optional "systemRequirements" systemRequirements FC.text
      #+ FC.optional "releaseDate" releaseDate FC.day
      #+ FC.required "uid" uid FC.text
      #+ FC.optional "ratings" ratings (FC.list contentRatingSchema)
      #+ FC.optional "stardateFrom" stardateFrom FC.float
      #+ FC.optional "genres" genres (FC.list genreSchema)
      #+ FC.required "title" title FC.text
      #+ FC.optional "references" references (FC.list referenceSchema)
      #+ FC.optional "yearTo" yearTo FC.integer
      #+ FC.optional "developers" developers (FC.list companyBaseSchema)
      #+ FC.optional "platforms" platforms (FC.list platformSchema)