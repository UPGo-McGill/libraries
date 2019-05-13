### SERVICE AREA COMPARISON ####################################################

source("R/01 helper_functions.R")

## 2016 and 2006 service area comparisons

library_service_comparison_2016 <- st_intersect_summarize(
  CTs_2016,
  service_areas_2016,
  group_vars = vars(CMA_name, library, PR_UID),
  population = population,
  sum_vars = vars(housing_need, lone_parent, immigrants, visible_minorities),
  mean_vars = vars(unemployed_pct, med_income)) %>% 
  ungroup() %>%
  mutate(unemployed_pct = unemployed_pct * 0.01) %>% 
  drop_units() 

library_service_comparison_2006 <- st_intersect_summarize(
  CTs_2006,
  service_areas_2006,
  group_vars = vars(CMA_name, library, PR_UID),
  population = population,
  sum_vars = vars(housing_need, lone_parent, immigrants, visible_minorities),
  mean_vars = vars(unemployed_pct, med_income)) %>% 
  ungroup() %>%
  mutate(unemployed_pct = unemployed_pct * 0.01) %>% 
  drop_units()


## Summaries for the two years

summary_2016_unweighted <- 
  library_service_comparison_2016 %>%
  st_drop_geometry() %>% 
  select(-CMA_name, -population) %>%
  group_by(library) %>%
  summarize_all(mean)

summary_2006_unweighted <- 
  library_service_comparison_2006 %>%
  st_drop_geometry() %>%
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
  

## Tidying data

tidy_summary_2006 <- gather(summary_2006_weighted, housing_need, lone_parent, 
                            immigrants, visible_minorities, unemployed_pct, 
                            med_income, key = "census_variable",
                            value = "value") %>% 
  mutate(date = "2006") %>% 
  drop_units()

tidy_summary_2016 <- gather(summary_2016_weighted, housing_need, lone_parent, 
                            immigrants, visible_minorities, unemployed_pct, 
                            med_income, key = "census_variable",
                            value = "value") %>% 
  mutate(date = "2016") %>% 
  drop_units()

tidy_summary <- rbind(tidy_summary_2006, tidy_summary_2016)

rm(tidy_summary_2006, tidy_summary_2016)

library_service_comparison <- rbind(library_service_comparison_2006 %>% 
                                      mutate(date = "2006"), 
                                    library_service_comparison_2016 %>% 
                                      mutate(date = "2016")) %>% 
  group_by(CMA_name) %>% 
  drop_units() %>% 
  mutate(region = case_when(
    PR_UID == 59 ~ "BC",
    PR_UID == 48 | PR_UID == 47 | PR_UID == 46 ~ "Prairies",
    PR_UID == 35 ~ "Ontario",
    PR_UID == 24 ~ "Quebec",
    PR_UID == 12 | PR_UID == 13 ~ "Atlantic"))

Canada_summary <- rbind(
  Canada_2006 %>% mutate(date = "2006") %>% select(-c(1, 4:5, 7:8)),
  Canada_2016 %>% mutate(date = "2016") %>% select(-c(1, 4:5, 7:8)))

names(Canada_summary) <-
  c("population", "unemployed_pct", "med_income", "housing_need", "lone_parent", "immigrants",
    "visible_minorities", "date", "geometry")
