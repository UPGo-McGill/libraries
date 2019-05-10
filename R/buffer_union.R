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

#plot(lib_buffer ["geometry"])

## Combine libraries 
comb_lib <- lib_buffer %>%
  summarize(name = "library",
            geometry = st_union(geometry))

#plot(comb_lib["geometry"])

## CMAs minus library areas
diff_lib <- st_difference(CMAs, comb_lib) %>%
  diff_lib[c(1,5,7)]
plot (diff_lib ["geometry"])
