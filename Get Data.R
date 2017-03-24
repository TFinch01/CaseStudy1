#Get Data from source websites
GDPSite<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
EDSite<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(GDPSite,destfile="GDP.csv")
download.file(EDSite,destfile="ED.csv")
list.files()
