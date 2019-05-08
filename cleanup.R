install.packages("tidyverse")
library(tidyverse)

London <-  read_csv("Data/London Library - Sheet1.csv")
names(London) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")
London
  
All_lib <- read_csv("Data/All Libraries.csv")
names(All_lib) <- c("Library_System", "Library_Branch", "City", "Latitude", "Longitude")
All_lib
View(All_lib)
