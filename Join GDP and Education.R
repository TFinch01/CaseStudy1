#Join the two data sets for only those observations with matching country codes
library(plyr)
GDPED <- join(GDPdata,EDdata, type = "inner",by='CountryCode')


