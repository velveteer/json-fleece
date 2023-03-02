{-# LANGUAGE NoImplicitPrelude #-}

module StarTrek.TradingCardBaseResponse
  ( TradingCardBaseResponse(..)
  , tradingCardBaseResponseSchema
  ) where

import Fleece.Core ((#+))
import qualified Fleece.Core as FC
import Prelude (($), Eq, Maybe, Show)
import qualified StarTrek.ResponsePage as ResponsePage
import qualified StarTrek.ResponseSort as ResponseSort
import qualified StarTrek.TradingCardBase as TradingCardBase

data TradingCardBaseResponse = TradingCardBaseResponse
  { tradingCards :: Maybe [TradingCardBase.TradingCardBase] -- ^ Base trading card, returned in search results
  , sort :: Maybe ResponseSort.ResponseSort -- ^ Response sort
  , page :: Maybe ResponsePage.ResponsePage -- ^ Object describing response page
  }
  deriving (Eq, Show)

tradingCardBaseResponseSchema :: FC.Fleece schema => schema TradingCardBaseResponse
tradingCardBaseResponseSchema =
  FC.object $
    FC.constructor TradingCardBaseResponse
      #+ FC.optional "tradingCards" tradingCards (FC.list TradingCardBase.tradingCardBaseSchema)
      #+ FC.optional "sort" sort ResponseSort.responseSortSchema
      #+ FC.optional "page" page ResponsePage.responsePageSchema