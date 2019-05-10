### HELPER FUNCTIONS ##########################################################

## Libraries

library(cancensus)
library(sf)
library(tidyverse)
library(tmap)


## st_erase helper function

st_erase <- function(x, y) st_difference(x, st_union(st_combine(y)))


## st_intersect_summarize helper function

st_intersect_summarize <- function(data, poly, group_vars, population, sum_vars,
                                   mean_vars) {
  
  pop <- enquo(population)
  
  data <- data %>% 
    mutate(CT_area = st_area(.))
  
  intersects <- suppressWarnings(st_intersection(data, poly)) %>%
    mutate(int_area_pct = st_area(.data$geometry) / .data$CT_area,
           population_int = !! pop * int_area_pct) %>%
    group_by(!!! group_vars)
  
  population <- intersects %>% 
    summarize(!! pop := sum(population_int, na.rm = TRUE))
  
  sums <- intersects %>%
    summarize_at(sum_vars, ~{sum(. * int_area_pct, na.rm = TRUE) / sum(population_int, na.rm = TRUE)})
  
  means <- intersects %>% 
    summarize_at(mean_vars, ~{
      sum(. * population_int, na.rm = TRUE) / sum(population_int, na.rm = TRUE)
    })
  
  suppressMessages(reduce(list(population,
                               st_drop_geometry(sums),
                               st_drop_geometry(means)),
                          full_join))
  
}

# make_library_service_areas

make_library_service_areas <- function(libraries, CMAs) {
  
  lib_buffer <-
    st_join(libraries, CMAs) %>%
    group_by(CMA_name) %>% 
    summarize(library = TRUE,
              geometry = st_union(geometry)) %>% 
    st_buffer(1000)
  
  diff_lib <- suppressWarnings(st_erase(CMAs, lib_buffer) %>% 
                                      mutate(library = FALSE) %>% 
                                      select(CMA_name, library, geometry))
  
  rbind(lib_buffer, diff_lib)
}
