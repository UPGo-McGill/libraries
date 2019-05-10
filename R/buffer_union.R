### BUFFER LIBRARIES ################################################################

source("R/helper_functions.R")
source("R/data_import.R")

## Buffer 1000 m = 1 km

lib_CMA <- st_join(Libraries, CMAs)

lib_buffer <- lib_CMA %>%
  group_by(name) %>% 
  summarize(library = TRUE,
            geometry = st_union(geometry)) %>% 
  st_buffer(1000)


diff_lib <- suppressWarnings(st_erase(CMAs, lib_buffer) %>% 
  mutate(library = FALSE) %>% 
  select(name, library, geometry))

service_areas <- rbind(lib_buffer, diff_lib)


# Service area comparison

library_service_comparison <- st_intersect_summarize(
  CTs,
  service_areas,
  group_vars = vars(name, library),
  population = Population,
  sum_vars = vars(Ct_Core_Hous, Ct_Lone_Parent, Ct_Imm, Ct_Vis_Min),
  mean_vars = vars(Pct_Unemployed, Med_AT_Income)
)




