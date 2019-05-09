# PACKAGES
install.packages("cancensus")
library(cancensus)
library(sf)
library(tidyverse)

# API KEY
options(cancensus.api_key = "CensusMapper_7f389ba345baaf2f6be7df4037991aa5")
options(cancensus.cache_path = "~/OneDrive - McGill University/Documents/RA - UPGo/libraries")

# DATA
variables <- list_census_vectors(dataset = "CA16")

regions <- list_census_regions("CA16")

CMAs <- get_census(dataset = 'CA16', regions = list(C = "Canada"), 
                   (level = 'CMA' ), vectors = c("v_CA16_2354", "v_CA16_4888", 
                                                 "v_CA16_488", "v_CA16_2398", "v_CA16_3411",
                                                 "v_CA16_3957"), geo_format = "sf")

CMAs <- st_transform(CMAs, 3347)

LibraryCMAs <- filter(CMAs, 
                        name == "Abbotsford - Mission (B)" |
                          name == "Barrie (B)" |
                          name == "Calgary (B)" |
                          name == "Chilliwack (K)" |
                          name == "Edmonton (B)" |
                          name == "Fredericton (K)" |
                          name == "Guelph (B)" |
                          name == "Halifax (B)" |
                          name == "Hamilton (B)" |
                          name == "Kelowna (B)" |
                          name == "Kingston (B)" |
                          name == "Kitchener - Cambridge - Waterloo (B)" |
                          name == "London (B)" |
                          name == "Moncton (B)" |
                          name == "Montréal (B)" |
                          name == "Nanaimo (K)" |
                          name == "Oshawa (B)" |
                          name == "Ottawa - Gatineau (B)" |
                          name == "Red Deer (K)" |
                          name == "Regina (B)" |
                          name == "Saint John (B)" |
                          name == "Saskatoon (B)" |
                          name == "St. Catharines - Niagara (B)" |
                          name == "Thunder Bay (B)" |
                          name == "Toronto (B)" |
                          name == "Vancouver (B)" |
                          name == "Victoria (B)" |
                          name == "Windsor (B)" |
                          name == "Winnipeg (B)" |
                          name == "Wood Buffalo (B)")

LibraryCMAs <- select(LibraryCMAs, -c(C_UID))

CDs <- get_census(dataset = "CA16", regions = list(C = "Canada"), 
                  (level = "CD"), vectors = c("v_CA16_2354", "v_CA16_4888", 
                                              "v_CA16_488", "v_CA16_2398", "v_CA16_3411",
                                              "v_CA16_3957"), geo_format = "sf")

CDs <- st_transform(CDs, 3347)

libraryCDs <- filter(CDs, 
                       name == "Fraser Valley (RD)" |
                       name == "Central Okanagan (RD)" |
                       name == "Columbia-Shuswap (RD)" |
                       name == "North Okanagan (RD)" |
                       name == "Okanagan-Similkameen (RD)" |
                       name == "Mount Waddington (RD)" |
                       name == "Strathcona (RD)" |
                       name == "Alberni-Clayoquot (RD)" |
                       name == "Comox Valley (RD)" |
                       name == "Nanaimo (RD)" |
                       name == "Cowichan Valley (RD)" |
                       name == "Capital (RD)" |
                       name == "Skeena-Queen Charlotte (RD)"|
                       name == "Madawaska (CT)" |
                       name == "Restigouche (CT)" |
                       name == "Gloucester (CT)" |
                       name == "Northumberland (CT)" |
                       name == "Victoria (CT)" |
                       name == "Carleton (CT)" |
                       name == "York (CT)" |
                       name == "Charlotte (CT)" |
                       name == "Sunbury (CT)" |
                       name == "Queens (CT)" |
                       name == "Kins (CT)" |
                       name == "Saint John (CT)" |
                       name == "Albert (CT)" |
                       name == "Westmorland (CT)"|
                       name == "Kent (CT)")

libraryAreas <- rbind(libraryCDs, LibraryCMAs)

# CENSUS TRACTS (NOT USING)
# CTs <- get_census(dataset = 'CA16', regions = list(C = "Canada"), (level = 'CT' ), geo_format = "sf")

# CTs %>% filter(Type=="CT") -> CTs

# Areas_and_CTs <- st_intersection (CTs, libraryAreas)

# plot(Areas_and_CTs["geometry"])

# DISSEMINATION AREAS
DAs <- get_census(dataset = "CA16", regions = list(C = "Canada"), 
                  (level = "DA"), vectors = c("v_CA16_2354", "v_CA16_4888", 
                                              "v_CA16_488", "v_CA16_2398", "v_CA16_3411",
                                              "v_CA16_3957"), geo_format = "sf")
DAs <- st_transform(DAs, 3347)

DAs_centroids <- st_centroid(DAs)

#Areas_and_DAs <- st_intersection(DAs, libraryAreas)

Areas_and_DAs <- st_join(libraryAreas, DAs_centroids) 

plot(Areas_and_DAs["geometry"])

plot(libraryAreas["geometry"])

Canadian_libraries <- read_csv("Canadian_libraries.csv")
Can_Lib1 = st_as_sf(Canadian_libraries, coords = c("Longitude", "Latitude"),
                    crs=4326) 
Can_Lib <- st_transform (Can_Lib1, 3347)

plot(Can_Lib[2])
plot(Areas_and_DAs["geometry"], add=T)


ggplot (Can_Lib) +
  geom_sf()

# To do :
  # Make sure library data is clean and recognized as lat logn
  # Buffer around library - how big do we want them to be?
  # Clip CTs to examine demographics within - income, focus on social need 
    # (drug addiction etc.?), core housing need, immigration status, race, ethnicity
  # Compare with city-wide variables
