### BUFFER LIBRARIES ################################################################

source("R/helper_functions.R")
source("R/data_import.R")

## Buffer 1000 m = 1 km

lib_CMA <- st_join(Libraries, CMAs)


lib_buffer <- lib_CMA %>%
  group_by(Library_System) %>% 
  summarize(name = first(name),
            geometry = st_union(geometry)) %>% 
  st_buffer(1000)

