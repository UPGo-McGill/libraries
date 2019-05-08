## Building Up Table
## May 8, 2019

library(tidyverse)
library(dplyr)

# Import cleaned data sets

Saskatoon <- read_csv("Data/Saskatoon Libraries - Sheet1.csv")
names(Saskatoon) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")

New_Brunswick <- read_csv("Data/New Brunswick Libraries - Sheet1.csv")
names(New_Brunswick) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")

Guelph <- read_csv("Data/Guelph Libraries - Sheet1.csv")
names(Guelph) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")

London <- read_csv("Data/London Library - Sheet1.csv")
names(London) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")

Other <- read_csv("Data/RH_TB_Regina_WB_Vaughan_LatLon.csv")
Other <- select(Other, -c(City ))
names(Other) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")


# To import: BC, Barrie, Brampton, Burlington, Calgary, Edmonton, Gatineau, Hamilton, 
#   Kingston, KitchenerWaterloo, Laval, Markham, Mississauga, Montreal, Oakville, 
#   Oshawa, Ottawa, Pickering, Red Deer, St Cats, Toronto, Windsor, Winnipeg


Canadian_libraries <- rbind(Saskatoon, New_Brunswick, Guelph, London, Other) 


