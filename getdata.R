DataFileUrl<-"http://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
DocUrl<-"http://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2Fpd01016005curr.pdf"
FAQUrl<-"http://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2FNCDC%20Storm%20Events-FAQ%20Page.pdf"
download.file(DataFileUrl,destfile="repdata_data_StormData.csv.bz2")
download.file(DocUrl,destfile="pd01016005curr.pdf")
download.file(FAQUrl,destfile="NCDC_Storm_Events-FAQ_Page.pdf")