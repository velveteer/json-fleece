{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.VideoReleaseFull
  ( VideoReleaseFull(..)
  , videoReleaseFullSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.ContentLanguage as ContentLanguage
import qualified StarTrek.ContentRating as ContentRating
import qualified StarTrek.Reference as Reference
import qualified StarTrek.SeasonBase as SeasonBase
import qualified StarTrek.SeriesBase as SeriesBase
import qualified StarTrek.VideoReleaseFormat as VideoReleaseFormat
import qualified StarTrek.VideoReleaseFull.AmazonDigitalRelease as AmazonDigitalRelease
import qualified StarTrek.VideoReleaseFull.DailymotionDigitalRelease as DailymotionDigitalRelease
import qualified StarTrek.VideoReleaseFull.GooglePlayDigitalRelease as GooglePlayDigitalRelease
import qualified StarTrek.VideoReleaseFull.ITunesDigitalRelease as ITunesDigitalRelease
import qualified StarTrek.VideoReleaseFull.NetflixDigitalRelease as NetflixDigitalRelease
import qualified StarTrek.VideoReleaseFull.NumberOfDataCarriers as NumberOfDataCarriers
import qualified StarTrek.VideoReleaseFull.NumberOfEpisodes as NumberOfEpisodes
import qualified StarTrek.VideoReleaseFull.NumberOfFeatureLengthEpisodes as NumberOfFeatureLengthEpisodes
import qualified StarTrek.VideoReleaseFull.Region1AReleaseDate as Region1AReleaseDate
import qualified StarTrek.VideoReleaseFull.Region1SlimlineReleaseDate as Region1SlimlineReleaseDate
import qualified StarTrek.VideoReleaseFull.Region2BReleaseDate as Region2BReleaseDate
import qualified StarTrek.VideoReleaseFull.Region2SlimlineReleaseDate as Region2SlimlineReleaseDate
import qualified StarTrek.VideoReleaseFull.Region4AReleaseDate as Region4AReleaseDate
import qualified StarTrek.VideoReleaseFull.Region4SlimlineReleaseDate as Region4SlimlineReleaseDate
import qualified StarTrek.VideoReleaseFull.RegionFreeReleaseDate as RegionFreeReleaseDate
import qualified StarTrek.VideoReleaseFull.RunTime as RunTime
import qualified StarTrek.VideoReleaseFull.Title as Title
import qualified StarTrek.VideoReleaseFull.Uid as Uid
import qualified StarTrek.VideoReleaseFull.UltraVioletDigitalRelease as UltraVioletDigitalRelease
import qualified StarTrek.VideoReleaseFull.VimeoDigitalRelease as VimeoDigitalRelease
import qualified StarTrek.VideoReleaseFull.VuduDigitalRelease as VuduDigitalRelease
import qualified StarTrek.VideoReleaseFull.XboxSmartGlassDigitalRelease as XboxSmartGlassDigitalRelease
import qualified StarTrek.VideoReleaseFull.YearFrom as YearFrom
import qualified StarTrek.VideoReleaseFull.YearTo as YearTo
import qualified StarTrek.VideoReleaseFull.YouTubeDigitalRelease as YouTubeDigitalRelease

data VideoReleaseFull = VideoReleaseFull
  { youTubeDigitalRelease :: Maybe YouTubeDigitalRelease.YouTubeDigitalRelease -- ^ Whether this video has been release on YouTube
  , numberOfFeatureLengthEpisodes :: Maybe NumberOfFeatureLengthEpisodes.NumberOfFeatureLengthEpisodes -- ^ Number of feature-length episodes
  , languagesSubtitles :: Maybe [ContentLanguage.ContentLanguage] -- ^ Rating of video release, etc.
  , yearFrom :: Maybe YearFrom.YearFrom -- ^ Starting year of video release story
  , iTunesDigitalRelease :: Maybe ITunesDigitalRelease.ITunesDigitalRelease -- ^ Whether this video has been release on iTunes
  , format :: Maybe VideoReleaseFormat.VideoReleaseFormat -- ^ Video release format
  , dailymotionDigitalRelease :: Maybe DailymotionDigitalRelease.DailymotionDigitalRelease -- ^ Whether this video has been release on Dailymotion
  , region1SlimlineReleaseDate :: Maybe Region1SlimlineReleaseDate.Region1SlimlineReleaseDate -- ^ Region 1 slimline release date
  , vuduDigitalRelease :: Maybe VuduDigitalRelease.VuduDigitalRelease -- ^ Whether this video has been release on VUDU
  , languagesDubbed :: Maybe [ContentLanguage.ContentLanguage] -- ^ Rating of video release, etc.
  , amazonDigitalRelease :: Maybe AmazonDigitalRelease.AmazonDigitalRelease -- ^ Whether this video has been release on Amazon.com
  , region4AReleaseDate :: Maybe Region4AReleaseDate.Region4AReleaseDate -- ^ Region 4 release date
  , runTime :: Maybe RunTime.RunTime -- ^ Run time, in minutes
  , uid :: Uid.Uid -- ^ Video release unique ID
  , ratings :: Maybe [ContentRating.ContentRating] -- ^ Rating of video release, etc.
  , vimeoDigitalRelease :: Maybe VimeoDigitalRelease.VimeoDigitalRelease -- ^ Whether this video has been release on Vimeo
  , region2SlimlineReleaseDate :: Maybe Region2SlimlineReleaseDate.Region2SlimlineReleaseDate -- ^ Region 2 slimline release date
  , googlePlayDigitalRelease :: Maybe GooglePlayDigitalRelease.GooglePlayDigitalRelease -- ^ Whether this video has been release on Google Play
  , title :: Title.Title -- ^ Video release title
  , region1AReleaseDate :: Maybe Region1AReleaseDate.Region1AReleaseDate -- ^ Region 1/A release date
  , xboxSmartGlassDigitalRelease :: Maybe XboxSmartGlassDigitalRelease.XboxSmartGlassDigitalRelease -- ^ Whether this video has been release on Xbox SmartGlass
  , references :: Maybe [Reference.Reference] -- ^ Reference of book, comics, video release, etc.
  , yearTo :: Maybe YearTo.YearTo -- ^ Ending year of video release story
  , ultraVioletDigitalRelease :: Maybe UltraVioletDigitalRelease.UltraVioletDigitalRelease -- ^ Whether this video has been release on UltraViolet
  , series :: Maybe SeriesBase.SeriesBase -- ^ Base series, returned in search results
  , region4SlimlineReleaseDate :: Maybe Region4SlimlineReleaseDate.Region4SlimlineReleaseDate -- ^ Region 4 slimline release date
  , languages :: Maybe [ContentLanguage.ContentLanguage] -- ^ Rating of video release, etc.
  , season :: Maybe SeasonBase.SeasonBase -- ^ Base season, returned in search results
  , region2BReleaseDate :: Maybe Region2BReleaseDate.Region2BReleaseDate -- ^ Region 2/B release date
  , netflixDigitalRelease :: Maybe NetflixDigitalRelease.NetflixDigitalRelease -- ^ Whether this video has been release on Netflix
  , numberOfDataCarriers :: Maybe NumberOfDataCarriers.NumberOfDataCarriers -- ^ Number of data carriers (like DVD, VCD, VHS etc.)
  , regionFreeReleaseDate :: Maybe RegionFreeReleaseDate.RegionFreeReleaseDate -- ^ Region free release date
  , numberOfEpisodes :: Maybe NumberOfEpisodes.NumberOfEpisodes -- ^ Number of episodes
  }
  deriving (Eq, Show)

videoReleaseFullSchema :: FC.Fleece schema => schema VideoReleaseFull
videoReleaseFullSchema =
  FC.object $
    FC.constructor VideoReleaseFull
      #+ FC.optional "youTubeDigitalRelease" youTubeDigitalRelease YouTubeDigitalRelease.youTubeDigitalReleaseSchema
      #+ FC.optional "numberOfFeatureLengthEpisodes" numberOfFeatureLengthEpisodes NumberOfFeatureLengthEpisodes.numberOfFeatureLengthEpisodesSchema
      #+ FC.optional "languagesSubtitles" languagesSubtitles (FC.list ContentLanguage.contentLanguageSchema)
      #+ FC.optional "yearFrom" yearFrom YearFrom.yearFromSchema
      #+ FC.optional "iTunesDigitalRelease" iTunesDigitalRelease ITunesDigitalRelease.iTunesDigitalReleaseSchema
      #+ FC.optional "format" format VideoReleaseFormat.videoReleaseFormatSchema
      #+ FC.optional "dailymotionDigitalRelease" dailymotionDigitalRelease DailymotionDigitalRelease.dailymotionDigitalReleaseSchema
      #+ FC.optional "region1SlimlineReleaseDate" region1SlimlineReleaseDate Region1SlimlineReleaseDate.region1SlimlineReleaseDateSchema
      #+ FC.optional "vuduDigitalRelease" vuduDigitalRelease VuduDigitalRelease.vuduDigitalReleaseSchema
      #+ FC.optional "languagesDubbed" languagesDubbed (FC.list ContentLanguage.contentLanguageSchema)
      #+ FC.optional "amazonDigitalRelease" amazonDigitalRelease AmazonDigitalRelease.amazonDigitalReleaseSchema
      #+ FC.optional "region4AReleaseDate" region4AReleaseDate Region4AReleaseDate.region4AReleaseDateSchema
      #+ FC.optional "runTime" runTime RunTime.runTimeSchema
      #+ FC.required "uid" uid Uid.uidSchema
      #+ FC.optional "ratings" ratings (FC.list ContentRating.contentRatingSchema)
      #+ FC.optional "vimeoDigitalRelease" vimeoDigitalRelease VimeoDigitalRelease.vimeoDigitalReleaseSchema
      #+ FC.optional "region2SlimlineReleaseDate" region2SlimlineReleaseDate Region2SlimlineReleaseDate.region2SlimlineReleaseDateSchema
      #+ FC.optional "googlePlayDigitalRelease" googlePlayDigitalRelease GooglePlayDigitalRelease.googlePlayDigitalReleaseSchema
      #+ FC.required "title" title Title.titleSchema
      #+ FC.optional "region1AReleaseDate" region1AReleaseDate Region1AReleaseDate.region1AReleaseDateSchema
      #+ FC.optional "xboxSmartGlassDigitalRelease" xboxSmartGlassDigitalRelease XboxSmartGlassDigitalRelease.xboxSmartGlassDigitalReleaseSchema
      #+ FC.optional "references" references (FC.list Reference.referenceSchema)
      #+ FC.optional "yearTo" yearTo YearTo.yearToSchema
      #+ FC.optional "ultraVioletDigitalRelease" ultraVioletDigitalRelease UltraVioletDigitalRelease.ultraVioletDigitalReleaseSchema
      #+ FC.optional "series" series SeriesBase.seriesBaseSchema
      #+ FC.optional "region4SlimlineReleaseDate" region4SlimlineReleaseDate Region4SlimlineReleaseDate.region4SlimlineReleaseDateSchema
      #+ FC.optional "languages" languages (FC.list ContentLanguage.contentLanguageSchema)
      #+ FC.optional "season" season SeasonBase.seasonBaseSchema
      #+ FC.optional "region2BReleaseDate" region2BReleaseDate Region2BReleaseDate.region2BReleaseDateSchema
      #+ FC.optional "netflixDigitalRelease" netflixDigitalRelease NetflixDigitalRelease.netflixDigitalReleaseSchema
      #+ FC.optional "numberOfDataCarriers" numberOfDataCarriers NumberOfDataCarriers.numberOfDataCarriersSchema
      #+ FC.optional "regionFreeReleaseDate" regionFreeReleaseDate RegionFreeReleaseDate.regionFreeReleaseDateSchema
      #+ FC.optional "numberOfEpisodes" numberOfEpisodes NumberOfEpisodes.numberOfEpisodesSchema