# PACKAGES
install.packages("cancensus")
library(cancensus)
library(sf)
library(tidyverse)

# API KEY
options(cancensus.api_key = "CensusMapper_7f389ba345baaf2f6be7df4037991aa5")
options(cancensus.cache_path = "~/OneDrive - McGill University/Documents/RA - UPGo/Libraries/libraries")

# DATA
variables <- list_census_vectors(dataset = "CA16")

regions <- list_census_regions("CA16")

CMAs <- get_census(dataset = 'CA16', regions = list(C = "Canada"), (level = 'CMA' ), geo_format = "sf")

onlyCMAs <- filter(CMAs, Type == "CMA")

CDs <- get_census(dataset = "CA16", regions = list(C = "Canada"), (level = "CD"), geo_format = "sf")

Library_Areas <- filter(CMAs, 
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


