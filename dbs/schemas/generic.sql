CREATE TABLE prices(
       	       symbol text
	     , fdate date
	     , open real
	     , high real
	     , low real
	     , close real
	     , adjusted_close real
	     , volume integer
	     , ema_50 real
	     , ema_200 real
	     , avgvol_14d real
	     , avgvol_50d real
	     , avgvol_200d real
	     , high_250 real
	     , low_250 real
	     , marketcapitalization real);
CREATE UNIQUE INDEX symboldate on prices(symbol, fdate);
CREATE TABLE symbols(
       	       symbol text
	     , name text
	     , exchange text);
CREATE UNIQUE INDEX symbol on symbols(symbol);
