###################
## Case Study 1 R Make File
## Travis Finch
## Created March 12, 2017
## Updated March 23, 2017
###################

#Set working directory
setwd("/Users/TravisFinch/Documents/SMU/Doing Data Science/CaseStudy/CaseStudyTF")

#Gather raw data files
source("Get Data.R")

#Read and Clean the GDP Data
source("Read and Clean GDP Data.R")

#Read and Clean the Education Data
source("Read and Clean Education Data.R")

#Join the Two Data Sets
source("Join GDP and Education.R")

#Answer the Questions to the Case Study
source("Case Study 1 Questions.R")
