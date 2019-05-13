# Western provinces: BC, AB, SK, MB

CTs_West_2016 <- CTs_2016 %>% 
  filter(PR_UID == 46 |
           PR_UID == 47 |
           PR_UID == 48 |
           PR_UID == 59)

CTs_West_2006 <- CTs_2006 %>% 
  filter(PR_UID == 46 |
          PR_UID == 47 |
          PR_UID == 48 |
          PR_UID == 59)

library_service_comparison_west_2016 <- st_intersect_summarize(
  CTs_West_2016,
  service_areas_2016,
  group_vars = vars(CMA_name, library),
  population = population,
  sum_vars = vars(housing_need, lone_parent, immigrants, visible_minorities),
  mean_vars = vars(unemployed_pct, med_income)) %>% 
  ungroup() %>%
  mutate(unemployed_pct = unemployed_pct * 0.01)

library_service_comparison_west_2006 <- st_intersect_summarize(
  CTs_West_2006,
  service_areas_2006,
  group_vars = vars(CMA_name, library),
  population = population,
  sum_vars = vars(housing_need, lone_parent, immigrants, visible_minorities),
  mean_vars = vars(unemployed_pct, med_income)) %>% 
  ungroup() %>%
  mutate(unemployed_pct = unemployed_pct * 0.01)

summary_2016_west_unweighted <- 
  library_service_comparison_west_2016 %>%
  st_drop_geometry() %>% 
  drop_units() %>%
  select(-CMA_name, -population) %>%
  group_by(library) %>%
  summarize_all(mean)

summary_2006_west_unweighted <- 
  library_service_comparison_west_2006 %>%
  st_drop_geometry() %>%
  drop_units() %>% 
  select(-CMA_name, -population) %>%
  group_by(library) %>%
  summarize_all(mean)

summary_2016_west_weighted <- 
  library_service_comparison_west_2016 %>% 
  st_drop_geometry() %>% 
  group_by(library) %>% 
  summarize_at(c("housing_need", "lone_parent", "immigrants",
                 "visible_minorities", "unemployed_pct", "med_income"),
               ~{sum(. * population, na.rm = TRUE) /
                   sum(population, na.rm = TRUE)})

summary_2006_west_weighted <- 
  library_service_comparison_west_2006 %>% 
  st_drop_geometry() %>% 
  group_by(library) %>% 
  summarize_at(c("housing_need", "lone_parent", "immigrants",
                 "visible_minorities", "unemployed_pct", "med_income"),
               ~{sum(. * population, na.rm = TRUE) /
                   sum(population, na.rm = TRUE)})


# Central provinces: ON, QC

CTs_Central_2016 <- CTs_2016 %>% 
  filter(PR_UID == 24 |
           PR_UID == 35)

CTs_Central_2006 <- CTs_2006 %>% 
  filter(PR_UID == 24 |
           PR_UID == 35)

library_service_comparison_central_2016 <- st_intersect_summarize(
  CTs_Central_2016,
  service_areas_2016,
  group_vars = vars(CMA_name, library),
  population = population,
  sum_vars = vars(housing_need, lone_parent, immigrants, visible_minorities),
  mean_vars = vars(unemployed_pct, med_income)) %>% 
  ungroup() %>%
  mutate(unemployed_pct = unemployed_pct * 0.01)

library_service_comparison_central_2006 <- st_intersect_summarize(
  CTs_Central_2006,
  service_areas_2006,
  group_vars = vars(CMA_name, library),
  population = population,
  sum_vars = vars(housing_need, lone_parent, immigrants, visible_minorities),
  mean_vars = vars(unemployed_pct, med_income)) %>% 
  ungroup() %>%
  mutate(unemployed_pct = unemployed_pct * 0.01)

summary_2016_central_unweighted <- 
  library_service_comparison_central_2016 %>%
  st_drop_geometry() %>% 
  drop_units() %>%
  select(-CMA_name, -population) %>%
  group_by(library) %>%
  summarize_all(mean)

summary_2006_central_unweighted <- 
  library_service_comparison_central_2006 %>%
  st_drop_geometry() %>%
  drop_units() %>% 
  select(-CMA_name, -population) %>%
  group_by(library) %>%
  summarize_all(mean)

summary_2016_central_weighted <- 
  library_service_comparison_central_2016 %>% 
  st_drop_geometry() %>% 
  group_by(library) %>% 
  summarize_at(c("housing_need", "lone_parent", "immigrants",
                 "visible_minorities", "unemployed_pct", "med_income"),
               ~{sum(. * population, na.rm = TRUE) /
                   sum(population, na.rm = TRUE)})

summary_2006_central_weighted <- 
  library_service_comparison_central_2006 %>% 
  st_drop_geometry() %>% 
  group_by(library) %>% 
  summarize_at(c("housing_need", "lone_parent", "immigrants",
                 "visible_minorities", "unemployed_pct", "med_income"),
               ~{sum(. * population, na.rm = TRUE) /
                   sum(population, na.rm = TRUE)})



# Eastern provinces: NS, NB

CTs_East_2016 <- CTs_2016 %>% 
  filter(PR_UID == 12 |
           PR_UID == 13)

CTs_East_2006 <- CTs_2006 %>% 
  filter(PR_UID == 12 |
           PR_UID == 13)

library_service_comparison_east_2016 <- st_intersect_summarize(
  CTs_East_2016,
  service_areas_2016,
  group_vars = vars(CMA_name, library),
  population = population,
  sum_vars = vars(housing_need, lone_parent, immigrants, visible_minorities),
  mean_vars = vars(unemployed_pct, med_income)) %>% 
  ungroup() %>%
  mutate(unemployed_pct = unemployed_pct * 0.01)

library_service_comparison_east_2006 <- st_intersect_summarize(
  CTs_East_2006,
  service_areas_2006,
  group_vars = vars(CMA_name, library),
  population = population,
  sum_vars = vars(housing_need, lone_parent, immigrants, visible_minorities),
  mean_vars = vars(unemployed_pct, med_income)) %>% 
  ungroup() %>%
  mutate(unemployed_pct = unemployed_pct * 0.01)

summary_2016_east_unweighted <- 
  library_service_comparison_east_2016 %>%
  st_drop_geometry() %>% 
  drop_units() %>%
  select(-CMA_name, -population) %>%
  group_by(library) %>%
  summarize_all(mean)

summary_2006_east_unweighted <- 
  library_service_comparison_east_2006 %>%
  st_drop_geometry() %>%
  drop_units() %>% 
  select(-CMA_name, -population) %>%
  group_by(library) %>%
  summarize_all(mean)

summary_2016_east_weighted <- 
  library_service_comparison_east_2016 %>% 
  st_drop_geometry() %>% 
  group_by(library) %>% 
  summarize_at(c("housing_need", "lone_parent", "immigrants",
                 "visible_minorities", "unemployed_pct", "med_income"),
               ~{sum(. * population, na.rm = TRUE) /
                   sum(population, na.rm = TRUE)})

summary_2006_east_weighted <- 
  library_service_comparison_east_2006 %>% 
  st_drop_geometry() %>% 
  group_by(library) %>% 
  summarize_at(c("housing_need", "lone_parent", "immigrants",
                 "visible_minorities", "unemployed_pct", "med_income"),
               ~{sum(. * population, na.rm = TRUE) /
                   sum(population, na.rm = TRUE)})


