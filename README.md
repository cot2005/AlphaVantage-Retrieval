# AlphaVantage-Retrieval
An R function to download 100 days of price and volume data for a list of tickers from Alpha Vantage.

This function requires an AlphaVantage key and will download 1 file every 20 seconds (default). 20 second frequency assumes a key for free downloads.
The function will write data tables as .txt files with headers (default) in the order of Date, Open, Close, High, Low, Volume.
