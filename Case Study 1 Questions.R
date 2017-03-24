###Question 1
NROW(GDPED)
#210 Country Codes matched between the GDP and Education Datasets

###Question 2
GDPEDNA <- GDPED

#Removes Countries with no GDP data
CompleteCol <- function(data, desiredCols) {
  completeVec <- complete.cases(data[, desiredCols])
  return(data[completeVec, ])
}
GDPEDNONA<-CompleteCol(GDPED,"GDP (millions of USD)")
GDPEDNONA<-CompleteCol(GDPED,"Rank")

SortedGDPEDNONA <- GDPEDNONA[ order(GDPEDNONA$"GDP (millions of USD)"),]
#Calculate number of countries without GDP data
nrow(GDPEDNA)-nrow(GDPEDNONA)
#21 countries are excluded
#13th country in the sorted list
#13th lowest reported GDP
SortedGDPEDNONA$Country[13:13]
#St. Kitts and Nevis has the 13th lowest reported GDP

###Question 3
with(subset(GDPEDNONA, Income.Group == "High income: OECD"), mean(Rank))
with(subset(GDPEDNONA, Income.Group == "High income: nonOECD"), mean(Rank))
#Average GDP Rank for High income: OECD is 32.96
#Average GDP Rank for High income: nonOECD is 91.91

###Question 4
#install.packages("ggplot2")
library(ggplot2)
qplot(GDPEDNONA$Income.Group,GDPEDNONA$"GDP (millions of USD)", color=GDPEDNONA$Income.Group, xlab="Income Group", ylab = "GDP")


###Question 5
tapply(GDPEDNONA$"GDP (millions of USD)", GDPEDNONA$Income.Group, summary)
"
High income: nonOECD
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
2584   12840   28370  104300  131200  711000 

High income: OECD
Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
13580   211100   486500  1484000  1480000 16240000 

Low income
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
596    3814    7843   14410   17200  116400 

Lower middle income
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
40    2549   24270  256700   81450 8227000 

Upper middle income
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
228    9613   42940  231800  205800 2253000
"

###Question 6
GDPEDNONA$quintile <- with(GDPEDNONA, cut(GDPEDNONA$Rank, 
                                breaks=quantile(GDPEDNONA$Rank, probs=seq(0,1, by=0.20), na.rm=TRUE), 
                                include.lowest=TRUE))
#Make Quintile Range Numeric
GDPEDNONA$quintile <- as.numeric(GDPEDNONA$quintile)
#Make Table
QuintileTable <-table(GDPEDNONA$quintile,GDPEDNONA$Income.Group)
QuintileTable
#There are 5 countries in the 1st Quintile for GDP that are in the Lower middle Income class