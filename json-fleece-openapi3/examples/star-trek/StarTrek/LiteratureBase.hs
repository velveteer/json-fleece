{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.LiteratureBase
  ( LiteratureBase(..)
  , literatureBaseSchema
  ) where

import qualified Fleece.Core as FC
import Data.Text (Text)
import Fleece.Core ((#+))
import Prelude (($), Bool, Eq, Maybe, Show)

data LiteratureBase = LiteratureBase
  { scientificLiterature :: Maybe Bool -- ^ Whether it's a scientific literature
  , shakespeareanWork :: Maybe Bool -- ^ Whether it's a Shakespearean work
  , uid :: Text -- ^ Literature unique ID
  , religiousLiterature :: Maybe Bool -- ^ Whether it's a religious literature
  , title :: Text -- ^ Literature title
  , technicalManual :: Maybe Bool -- ^ Whether it's a technical manual
  , earthlyOrigin :: Maybe Bool -- ^ Whether it's of earthly origin
  , report :: Maybe Bool -- ^ Whether it's a report
  }
  deriving (Eq, Show)

literatureBaseSchema :: FC.Fleece schema => schema LiteratureBase
literatureBaseSchema =
  FC.object $
    FC.constructor LiteratureBase
      #+ FC.optionalField FC.OmitKey_DelegateNull "scientificLiterature" scientificLiterature FC.boolean
      #+ FC.optionalField FC.OmitKey_DelegateNull "shakespeareanWork" shakespeareanWork FC.boolean
      #+ FC.required "uid" uid FC.text
      #+ FC.optionalField FC.OmitKey_DelegateNull "religiousLiterature" religiousLiterature FC.boolean
      #+ FC.required "title" title FC.text
      #+ FC.optionalField FC.OmitKey_DelegateNull "technicalManual" technicalManual FC.boolean
      #+ FC.optionalField FC.OmitKey_DelegateNull "earthlyOrigin" earthlyOrigin FC.boolean
      #+ FC.optionalField FC.OmitKey_DelegateNull "report" report FC.boolean