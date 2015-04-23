###reading the data into a dataframe
#StormData<-read.csv(bzfile("repdata_data_StormData.csv.bz2"))
#head(StormData)

###getting a sorted list (alphabetically) of all occurring event types
#UN_EV_SORT<-sort(unique(StormData$EVTYPE))

###this list tells us that 985 different event types have been recorded, while there are supposed to be 48.

###when we look at the website of the source data, http://www.ncdc.noaa.gov/stormevents/details.jsp, we notice that only after 1996 data was collected on all 48 event types. We therefore first reduced the dataframe to records dating Jan 1, 1996 or later.

#StormDataCopy <- StormData
#StormDataCopy$BGN_DATE <-as.Date(StormData$BGN_DATE, format="%m/%d/%Y")
#StormDataSplit<-StormDataCopy[StormDataCopy$BGN_DATE>="1996-01-01",]

###We determined the list of unique event types again, now for the "split" dataframe
#UN_EV_SPLIT_SORT<-sort(unique(StormDataSplit$EVTYPE))

###this result shows that the "split" dataframe contains all 985 event types as well. So let's look how many times each event type occurs.
library(plyr)
SPLIT_EVENT<-count(StormDataSplit$EVTYPE)
SPLIT_EVENT_s<-SPLIT_EVENT[order(-SPLIT_EVENT[,2],SPLIT_EVENT[,1]),]

#The second row in this dataframe contains an event that isn't listed in the official documentation. Let's determine which events contain the "TSTM" string.S
SEsub<-SPLIT_EVENT_s[grepl("TSTM",SPLIT_EVENT_s[,1]),]
SEOsub<-SEsub[order(-SEsub[,2],SEsub[,1]),]

#Let's replace all rows that contain "TSTM"  but not "Marine TSTM" with "THUNDERSTORM WIND"

