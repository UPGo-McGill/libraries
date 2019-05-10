### DATA IMPORT ################################################################

source("R/helper_functions.R")


## Import CMAs

CMAs <-
  get_census(
    dataset = 'CA16', regions = list(C = "Canada"), 
    level = 'CMA',
    geo_format = "sf") %>% 
  st_transform(3347)

## Import CTs

CTs <-
  get_census(
    dataset = "CA16", regions = list(C = "Canada"), 
    level = "CT",
    vectors = c("v_CA16_2354", "v_CA16_4888", "v_CA16_488", "v_CA16_2398",
                "v_CA16_3411", "v_CA16_3957"),
    geo_format = "sf") %>% 
  st_transform(3347)

## Import libraries

Libraries <- suppressWarnings(read_csv("data/Canadian_libraries.csv") %>% 
  st_as_sf(coords = c("Longitude", "Latitude"), crs=4326) %>%
  st_transform(3347))


## Filter tables to relevant ones

# CMAs and CTs that are actually CMAs and CTs
CMAs <- CMAs %>% filter(Type == "CMA")
CTs <- CTs %>% filter(Type == "CT")

#Libraries in CMAs
Libraries <- Libraries[lengths(st_within(Libraries, CMAs)) > 0,]

#CMAs and CTs that contain libraries
CMAs <- CMAs[lengths(st_contains(CMAs, Libraries)) > 0,]
CTs <- CTs[lengths(st_within(CTs, CMAs)) >0,]
CTs <- CTs[,c(5:7,9,15:21)]


## Add CMA names to the CTs table

CTs$CMAs <- st_within(CTs,CMAs)

CMA_name <- CMAs[,c(5,7)]
CMA_name$CMAs <- 1:30
CMA_name <- CMA_name[c(4,1,2,3)]

CTs <- st_join(CTs, CMA_name, by = "CMAs")


CTs <- CTs %>% 
  st_join(CMA_name, by = "CMAs" ) %>% 
  select(-c(11,12,13))
CTs <- 
  CTs[c(1,4,11,2,3,5,6,7,8,9,10,12)] %>% 
  rename(CMA_Name = name)

