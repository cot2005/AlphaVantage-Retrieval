AVRetrieve<-function(tickers, AVKey, sltime = 20, headers = TRUE) {
  tickersnum <- length(tickers)
  
  #downloads the dayrange of data for each stock
  for (i in 1:tickersnum) {
    avhtml <- paste("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=", tickers[i],"&apikey=", AVKey,"&datatype=csv", 
                    sep = "")   #url string with key 
    avdata = read.csv(url(avhtml), header = TRUE)   #retrieves data
    #rearranges the datatable
    tickerdata <- data.frame(Date = as.Date(avdata[,1]), Open = avdata[,2], Close = avdata[,5],
                             High = avdata[,3], Low = avdata[,4], Volume = avdata[,6])
    filename <- paste(tickers[i],".txt", sep = "")
    write.table(tickerdata, filename, col.names=headers, row.names=FALSE, sep = "\t", quote = FALSE)
    print(paste("file saved as ", filename, sep = ""))
    Sys.sleep(sltime)
  }
}
