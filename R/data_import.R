### DATA IMPORT ################################################################

source("data/helper_functions.R")


## Import CMAs

CMAs <-
  get_census(
    dataset = 'CA16', regions = list(C = "Canada"), 
    level = 'CMA',
    geo_format = "sf") %>% 
  st_transform(3347)


## Import DAs

DAs <-
  get_census(
    dataset = "CA16", regions = list(C = "Canada"), 
    level = "DA",
    vectors = c("v_CA16_2354", "v_CA16_4888", "v_CA16_488", "v_CA16_2398",
                "v_CA16_3411", "v_CA16_3957"),
    geo_format = "sf") %>% 
  st_transform(3347)


## Import libraries

Libraries <- suppressWarnings(read_csv("data/Canadian_libraries.csv") %>% 
  st_as_sf(coords = c("Longitude", "Latitude"), crs=4326) %>%
  st_transform(3347))


## Filter tables to relevant ones

CMAs <- CMAs %>% filter(Type == "CMA")
Libraries <- Libraries[lengths(st_within(Libraries, CMAs)) > 0,]
CMAs <- CMAs[lengths(st_contains(CMAs, Libraries)) > 0,]
DAs <- DAs[lengths(st_within(DAs, CMAs)) > 0,]
DAs <- DAs[,c(5:8,11,13:19)]

