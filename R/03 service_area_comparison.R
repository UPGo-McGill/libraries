### SERVICE AREA COMPARISON ####################################################

source("R/01 helper_functions.R")

## 2016 and 2006 service area comparisons

library_service_comparison_2016 <- st_intersect_summarize(
  CTs_2016,
  service_areas_2016,
  group_vars = vars(CMA_name, library),
  population = population,
  sum_vars = vars(housing_need, lone_parent, immigrants, visible_minorities),
  mean_vars = vars(unemployed_pct, med_income)) %>% 
  ungroup() %>%
  mutate(unemployed_pct = unemployed_pct * 0.01)

library_service_comparison_2006 <- st_intersect_summarize(
  CTs_2006,
  service_areas_2006,
  group_vars = vars(CMA_name, library),
  population = population,
  sum_vars = vars(housing_need, lone_parent, immigrants, visible_minorities),
  mean_vars = vars(unemployed_pct, med_income)) %>% 
  ungroup() %>%
  mutate(unemployed_pct = unemployed_pct * 0.01)


## Summaries for the two years

summary_2016_unweighted <- 
  library_service_comparison_2016 %>%
  st_drop_geometry() %>% 
  drop_units() %>%
  select(-CMA_name, -population) %>%
  group_by(library) %>%
  summarize_all(mean)

summary_2006_unweighted <- 
  library_service_comparison_2006 %>%
  st_drop_geometry() %>%
  drop_units() %>% 
  select(-CMA_name, -population) %>%
  group_by(library) %>%
  summarize_all(mean)


## Summaries by weighted mean

summary_2016_weighted <- 
  library_service_comparison_2016 %>% 
  st_drop_geometry() %>% 
  group_by(library) %>% 
  summarize_at(c("housing_need", "lone_parent", "immigrants",
                 "visible_minorities", "unemployed_pct", "med_income"),
               ~{sum(. * population, na.rm = TRUE) /
                   sum(population, na.rm = TRUE)})

summary_2006_weighted <- 
  library_service_comparison_2006 %>% 
  st_drop_geometry() %>% 
  group_by(library) %>% 
  summarize_at(c("housing_need", "lone_parent", "immigrants",
                 "visible_minorities", "unemployed_pct", "med_income"),
               ~{sum(. * population, na.rm = TRUE) /
                   sum(population, na.rm = TRUE)})
  