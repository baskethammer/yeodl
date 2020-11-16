CREATE TABLE prices(symbol text, fdate date, open real, high real, low real, close real, adjusted_close real, volume integer, ema_50 real, ema_200 real, avgvol_14d real, avgvol_50d real, avgvol_200d real, high_250 real, low_250 real, marketcapitalization real);
CREATE UNIQUE INDEX symboldate on prices(symbol, fdate);
CREATE TABLE symbols(symbol text, name text, exchange text);
CREATE UNIQUE INDEX symbol on symbols(symbol);
CREATE TABLE highlights(
               symbol text
	     , MarketCapitalization real
	     , MarketCapitalizationMln real
	     , EBITDA real
	     , PERATIO real
	     , PEGRatio real 
	     , WallStreetTargetPrice real
	     , BookValue real
	     , DividendShare real
	     , DividendYield real
	     , EarningsShare real
	     , EPSEstimateCurrentYear real
	     , EPSEstimateNextYear real
	     , EPSEstimateNextQuarter real
	     , EPSEstimateCurrentQuarter real
	     , MostRecentQuarter real
	     , ProfitMargin real
	     , OperatingMarginTTM real
	     , ReturnOnAssetsTTM real
	     , ReturnOnEquityTTM real
	     , RevenueTTM real
	     , RevenuePerShareTTM real
	     , QuarterlyRevenueGrowthYOY real
	     , GrossProfitTTM real
	     , DilutedEpsTTM real
	     , QuarterlyEarningsGrowthYOY real);
CREATE UNIQUE INDEX symbol_highlights on highlights(symbol);
CREATE TABLE sharesstats(
       	       symbol text
	     , SharesOutstanding real
	     , SharesFloat real
	     , PercentInsiders real
	     , PercentInstitutions real
	     , SharesShort real
	     , SharesShortPriorMonth real
	     , ShortRatio real
	     , ShortPercentOutstanding real
	     , ShortPercentFloat real);
CREATE UNIQUE INDEX symbol_sharesstats on sharesstats(symbol);
CREATE TABLE earnings_history(
       	       symbol text
	     , q1 real
	     , q2 real
	     , q3 real
	     , q4 real
	     , q5 real
	     , q6 real
	     , q7 real
	     , q8 real
	     , q9 real
	     , q10 real
	     , q11 real
	     , q12 real
	     , q13 real
	     , q14 real
	     , q15 real
	     , q16 real
	     , q17 real
	     , q18 real
	     , q19 real
	     , q20 real);
CREATE UNIQUE INDEX symbol_earnings_history on earnings_history(symbol);
CREATE TABLE technicals(
       	       symbol text
	     , Beta real
	     , "52WeekHigh" real
	     , "52WeekLow" real
	     , "50DayMA" real
	     , "200DayMA" real
	     , SharesShort real
	     , SharesShortPriorMonth real
	     , ShortRatio real
	     , ShortPercent real);
CREATE UNIQUE INDEX symbol_technicals on technicals(symbol);
CREATE TABLE valuations(
              symbol text
     , TrailingPE real
     , ForwardPE real
     , PriceSalesTTM real
     , PriceBookMRQ real
     , EnterpriseValueRevenue real
     , EnterpriseValueEbitda real);
CREATE UNIQUE INDEX symbol_valuations on valuations(symbol);
CREATE TABLE descriptions(
              symbol text
     , "Type" text
     , "Name" text
     , Exchange text
     , Sector text
     , Industry text
     , WebURL text);
CREATE UNIQUE INDEX symbol_descriptions on descriptions(symbol);
