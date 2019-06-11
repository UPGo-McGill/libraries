## MAPPING

source("R/01 helper_functions.R")
source("R/02 data_import.R")

## Mapping by CMA
  ## Input desired city and dataframes corresponding to the desired year

cityname <- "Toronto (B)"
year <- "2016"
service_areas_year <- service_areas_2016
CTs_year <- CTs_2016
CMAs_year <- CMAs_2016

tm_shape(filter(CMAs_2016, CMA_name == cityname)) +
  tm_dots(col = 'black') +
tm_shape(filter(service_areas_year, CMA_name == cityname & library == TRUE)) +
  tm_borders(col = 'black') +
  tm_shape(filter(CTs_year, CMA_name == cityname)) +
  tm_polygons(c("unemployed_pct", 
                "med_income", 
                "housing_need_pct",
                "visible_minorities_pct"), border.alpha = 0)  + 
tm_shape(water) +
  tm_fill(col = "grey85") +
tm_shape(coastal_water) +
  tm_fill(col = "grey85") +
tm_facets(sync = TRUE, ncol = 2) +
tm_layout(main.title = cbind(cityname, year), 
          main.title.position = "left", 
          legend.position = c("right", "bottom"),
          frame = FALSE) +
tm_compass()

## Mapping by library system
  ## Input desired city, library system, and dataframes corresponding to the desired year
library_system <- "Bibliotheque et Archives Nationales du Quebec"
libraries_year <- libraries_2016
CTs_year <- CTs_2016
cityname <- "Montreal (B)"


tm_shape(st_buffer(
  filter(libraries_year, Library_System == 
           library_system), 1000),
  ext = 1) +
  tm_dots(col = 'black') +
  tm_shape(filter(CTs_year, CMA_name == cityname)) +
  tm_polygons("housing_need_pct", 
              border.alpha = 0,
              legend.format=list(fun=function(x) {
                paste0(formatC(x * 100, digits = 0, format="f"), " %")
              })) +
  tm_shape(water) +
    tm_fill(col = "grey85") +
  tm_shape(coastal_water) +
    tm_fill(col = "grey85") +
  tm_shape(st_buffer(
    filter(libraries_year, Library_System ==
             library_system), 1000)) +
    tm_borders(col= 'black') +
  tm_layout(legend.position = c("left", "top"),
            frame = FALSE) +
  tm_compass()