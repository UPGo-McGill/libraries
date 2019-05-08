## Building Up Table
## May 8, 2019

library(tidyverse)
library(dplyr)

# Import and clean data sets


# Saskatoon
Saskatoon <- read_csv("Data/Saskatoon Libraries - Sheet1.csv")
names(Saskatoon) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")


# New Brunswick
New_Brunswick <- read_csv("Data/New Brunswick Libraries - Sheet1.csv")
names(New_Brunswick) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")

# London
London <- read_csv("Data/London Library - Sheet1.csv")
names(London) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")


# Waterloo
Waterloo <- read_csv ("Data/KitchenerWaterloo_Libraries.csv")
Waterloo %>% 
  select(c(7, 4, 2, 1))->
  Waterloo
Waterloo <- filter(Waterloo, Name == "Waterloo Main Library" | Name == "Mccormick Branch Library" | Name == "John M. Harper Branch Library")
names(Waterloo) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")


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


#Windsor
Windsor <- read_csv("Data/Windsor_Libraries.csv")
Windsor <- select(Windsor, c(3, 5:6))
Windsor$Library_System <- "Windsor Public Library"
names(Windsor) <- c("Library_Branch", "Longitude", "Latitude", "Library_System")
Windsor <- Windsor[c(4,1,3,2)]


# Other - Richmond Hill, Thunder Bay, Regina, Wood Buffalo, Vaughan, Red Deer, Milton, Burnaby, Coquitlam, 
#   Barrie, Calgary, Edmonton, Gatineau,
#   Guelph, Hamilton, Kingston, Laval, Mississauga, Okanagan, Richmond, Surrey, Vancouver Island, Vancouver
Other <- read_csv("Data/All Libraries.csv")
Other <- select(Other, -c(City ))
names(Other) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")


#Kitchener
Kitchener <- read_csv ("Data/KitchenerWaterloo_Libraries.csv")
Kitchener %>% 
  select(c(7, 4, 2, 1))->
  Kitchener
Kitchener <- filter(Kitchener, Name == "Kitchener Main Library" | Name == "Country Hills Community Library" | 
                      Name == "Forest Heights Community Library" 
                    | Name == "Grand River Stanley Park Community Library" | Name == "Pioneer Park Community Library")
names(Kitchener) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")


#Idea Exchange - Cambridge
Idea_Exchange <- read_csv ("Data/KitchenerWaterloo_Libraries.csv")
Idea_Exchange %>% 
  select(c(7, 4, 2, 1))->
  Idea_Exchange
Idea_Exchange <- filter(Idea_Exchange, Name == "Queen'S Square Library" | Name == "Preston Library" | Name == "Hespeler Library" 
                        | Name == "Clemens Mill Library")
names(Idea_Exchange) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")
Idea_Exchange_2 <- data.frame("Cambridge Libraries", "Old Post Office Library", 43.358338, -80.315516)
names(Idea_Exchange_2)<- c("Library_System", "Library_Branch", "Latitude", "Longitude")
Idea_Exchange_3 <- data.frame("Cambridge Libraries", "Design at Riverside", 43.358486, -80.316740)
names(Idea_Exchange_3)<- c("Library_System", "Library_Branch", "Latitude", "Longitude")
Idea_Exchange <- rbind(Idea_Exchange, Idea_Exchange_2, Idea_Exchange_3)

# Toronto
Toronto <- read_csv("Data/Toronto_Libraries.csv")
Toronto %>% 
  select(c(1, 6:7))->
  Toronto
Toronto$Library_System <- "Toronto Public Library"
Toronto <- Toronto[c(4, 1, 3, 2)]
names(Toronto) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")


# St. Catharines
St_Cats <- read_csv("Data/StCatharines_libraries.csv")
St_Cats <- filter(St_Cats, Municipality == "St. Catharines")
St_Cats %>% 
  select(c(1, 7:8)) ->
  St_Cats
St_Cats$Library_System <- "St. Catharines Public Library"
St_Cats <- St_Cats[c(4,1,3,2)]
names(St_Cats) <- c("Library_System", "Library_Branch", "Latitude", "Longitude")

# Halifax
Halifax <- read_csv("Data/Halifax_Libraries.csv")

# Markham
Markham <- read_csv("Data/Markham_libraries.csv")

# To import: Brampton, Burlington,  Montreal, Oakville, Oshawa, Ottawa, 
    # Pickering, Hamilton, Kingston (remainder)

# Compile into one table
Canadian_libraries <- rbind(Saskatoon, New_Brunswick, London, Windsor, Winnipeg, 
                            Other, Waterloo, Kitchener, Idea_Exchange, Toronto, St_Cats, Halifax, Markham) 

