# Importing and cleaning data
# May 8, 2019

library(tidyverse)

# Winnipeg
Winnipeg <- read_csv("Data/Winnipeg_Library.csv")
Winnipeg <- select(Winnipeg, c(1,12))
Winnipeg$Library_System <- "Winnipeg Public Library"
names(Winnipeg) <- c("Library_Branch", "Location", "Library_System")
Winnipeg %>% 
  separate(Location, c("Latitude", "Longitude"), sep = ",") ->
  Winnipeg
Winnipeg <- Winnipeg[c(4, 1, 2, 3)]

Winnipeg$Latitude <- substr(Winnipeg$Latitude, 2, 1000)

Winnipeg$Longitude <-substr(Winnipeg$Longitude, 1, nchar(Winnipeg$Longitude) - 1)

# Windsor
Windsor <- read_csv("Data/Windsor_Libraries.csv")
Windsor <- select(Windsor, c(3, 5:6))
Windsor$Library_System <- "Windsor Public Library"
names(Windsor) <- c("Library_Branch", "Longitude", "Latitude", "Library_System")
Windsor <- Windsor[c(4,1,3,2)]


# Waterloo
Waterloo <- read_csv ("Data/KitchenerWaterloo_Libraries.csv")
Waterloo %>% 
  select(c(7, 4, 2, 1))->
  Waterloo
Waterloo <- filter(Waterloo, Name == "Waterloo Main Library" | Name == "Mccormick Branch Library" | Name == "John M. Harper Branch Library")
names(Waterloo) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")

# Kitchener
Kitchener <- read_csv ("Data/KitchenerWaterloo_Libraries.csv")
Kitchener %>% 
  select(c(7, 4, 2, 1))->
  Kitchener
Kitchener <- filter(Kitchener, Name == "Kitchener Main Library" | Name == "Country Hills Community Library" | Name == "Forest Heights Community Library" 
                    | Name == "Grand River Stanley Park Community Library" | Name == "Pioneer Park Community Library")
names(Kitchener) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")



