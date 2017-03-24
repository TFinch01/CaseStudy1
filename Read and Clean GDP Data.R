GDPraw <- read.csv("GDP.csv", stringsAsFactors=FALSE, header=FALSE)
head(GDPraw,10)

tail(GDPraw,150)

GDPdata <- GDPraw[,colSums(is.na(GDPraw))<nrow(GDPraw)]

GDPdata <- GDPdata[6:220,]


names(GDPdata)
str(GDPdata)

names(GDPdata) <- c("CountryCode","Rank","Country","GDP (millions of USD)")

GDPdata$"GDP (millions of USD)" <- gsub(",", "", GDPdata$"GDP (millions of USD)")
GDPdata$"GDP (millions of USD)" <- as.numeric(GDPdata$"GDP (millions of USD)")
GDPdata$"Rank" <- as.numeric(GDPdata$"Rank")

#Removes Rows with no data
GDPdata <- GDPdata[!(is.na(GDPdata$CountryCode) | GDPdata$CountryCode==""), ]

