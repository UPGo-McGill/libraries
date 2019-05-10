### SERVICE AREA COMPARISON ####################################################

source("R/helper_functions.R")

## 2016 and 2006 service area comparisons

library_service_comparison_2016 <- st_intersect_summarize(
  CTs_2016,
  service_areas_2016,
  group_vars = vars(CMA_name, library),
  population = population,
  sum_vars = vars(housing_need, lone_parent, immigrants, visible_minorities),
  mean_vars = vars(unemployed_pct, med_income)
)

library_service_comparison_2006 <- st_intersect_summarize(
  CTs_2006,
  service_areas_2006,
  group_vars = vars(CMA_name, library),
  population = population,
  sum_vars = vars(housing_need, lone_parent, immigrants, visible_minorities),
  mean_vars = vars(unemployed_pct, med_income)
)

## Summaries for the two years

summary_2016 <- 
  library_service_comparison_2016 %>%
  ungroup() %>%
  st_drop_geometry() %>%
  select(-CMA_name, -population) %>%
  group_by(library)%>%
  summarize_all(mean)

summary_2006 <- 
  library_service_comparison_2006 %>%
  ungroup() %>% 
  st_drop_geometry()%>%
  select(-CMA_name, -population) %>%
  group_by(library)%>%
  summarize_all(mean)

